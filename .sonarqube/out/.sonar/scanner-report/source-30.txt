using HealthAxis.API.Data;
using MassTransit;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi;
using S4_HealthAxisApi.BackgroundServices;
using S4_HealthAxisApi.Consumers;
using S4_HealthAxisApi.Messaging;
using S4_HealthAxisApi.Middleware;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Implementation;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using S4_HealthAxisApi.Services.Interface;
using Serilog;
using System.Text;
using System.Text.Json;
using Elastic.Ingest.Elasticsearch;
using Elastic.Ingest.Elasticsearch.DataStreams;
using Elastic.Serilog.Sinks;

var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog((context, services, configuration) =>
{
    var elasticSection = context.Configuration.GetSection("ElasticSearch");

    var elasticEnabled =
        bool.TryParse(elasticSection["Enabled"], out var enabled) &&
        enabled;

    var elasticUri = elasticSection["Uri"];
    var dataStreamDataset =
        elasticSection["DataStreamDataset"] ?? "healthaxis-api";

    var dataStreamNamespace =
        elasticSection["DataStreamNamespace"] ?? "local";

    configuration
        .ReadFrom.Configuration(context.Configuration)
        .ReadFrom.Services(services)
        .Enrich.FromLogContext()
        .Enrich.WithProperty("Application", "S4_HealthAxisApi")
        .WriteTo.Console()
        .WriteTo.File(
            "logs/healthaxis-.log",
            rollingInterval: RollingInterval.Day,
            retainedFileCountLimit: 7);

    if (elasticEnabled &&
        !string.IsNullOrWhiteSpace(elasticUri))
    {
        configuration.WriteTo.Elasticsearch(
            new[] { new Uri(elasticUri) },
            options =>
            {
                options.DataStream =
                    new DataStreamName(
                        "logs",
                        dataStreamDataset,
                        dataStreamNamespace);

                options.BootstrapMethod =
                    BootstrapMethod.Silent;
            });
    }
});

#region Controllers

builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.PropertyNamingPolicy =
            JsonNamingPolicy.CamelCase;
    });

#endregion

#region Swagger

builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc(
        "v1",
        new OpenApiInfo
        {
            Title = "HealthAxis API",
            Version = "v1",
            Description = "Healthcare Appointment Management API"
        });

    options.AddSecurityDefinition(
        "bearer",
        new OpenApiSecurityScheme
        {
            Name = "Authorization",
            In = ParameterLocation.Header,
            Type = SecuritySchemeType.Http,
            Scheme = "bearer",
            BearerFormat = "JWT",
            Description = "Enter JWT token.\n\nExample: Bearer eyJhbGciOiJIUzI1NiIs..."
        });

    options.AddSecurityRequirement(document =>
        new OpenApiSecurityRequirement
        {
            [new OpenApiSecuritySchemeReference(
                "bearer",
                document)] = []
        });
});

#endregion

#region Database

builder.Services.AddDbContext<HealthAxisDbContext>(options =>
{
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("DefaultConnection"));
});

#endregion

#region Garnet Distributed Cache

builder.Services.AddStackExchangeRedisCache(options =>
{
    options.Configuration =
        builder.Configuration.GetSection("Garnet")["ConnectionString"];

    options.InstanceName =
        builder.Configuration.GetSection("Garnet")["InstanceName"] ?? "HealthAxis:";
});

#endregion

#region JWT Authentication

builder.Services.AddAuthentication(
    JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        var jwt = builder.Configuration.GetSection("Jwt");

        options.TokenValidationParameters =
            new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwt["Issuer"],

                ValidateAudience = true,
                ValidAudience = jwt["Audience"],

                ValidateLifetime = true,

                ValidateIssuerSigningKey = true,

                IssuerSigningKey =
                    new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(jwt["Key"]!)),

                ClockSkew = TimeSpan.Zero
            };
    });

builder.Services.AddAuthorization();

#endregion

#region CORS

builder.Services.AddCors(options =>
{
    options.AddPolicy(
        "BlazorPolicy",
        policy =>
        {
            policy
                .WithOrigins(
                    "https://localhost:7206",
                    "http://localhost:4200"
                )
                .AllowAnyHeader()
                .AllowAnyMethod();
        });
});

#endregion

#region Repositories

builder.Services.AddScoped<IPatientRepository, PatientRepository>();
builder.Services.AddScoped<IDoctorRepository, DoctorRepository>();
builder.Services.AddScoped<IAppointmentRepository, AppointmentRepository>();
builder.Services.AddScoped<IHealthRecordRepository, HealthRecordRepository>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IAdminRepository, AdminRepository>();
builder.Services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>();

#endregion

#region Services

builder.Services.AddScoped<IPatientService, PatientService>();
builder.Services.AddScoped<IDoctorService, DoctorService>();
builder.Services.AddScoped<IAppointmentService, AppointmentService>();
builder.Services.AddScoped<IHealthRecordService, HealthRecordService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IAdminService, AdminService>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IRabbitMqPublisher, RabbitMqPublisher>();

#endregion

#region Background Services

builder.Services.AddHostedService<HeartbeatService>();
builder.Services.AddHostedService<NotificationCleanupService>();
builder.Services.AddHostedService<AppointmentMaintenanceService>();

#endregion

#region MassTransit RabbitMQ

builder.Services.AddMassTransit(options =>
{
    options.AddConsumer<AppointmentBookedConsumer>();

    options.UsingRabbitMq((context, cfg) =>
    {
        cfg.Host("localhost", "/", host =>
        {
            host.Username("guest");
            host.Password("guest");
        });

        cfg.ReceiveEndpoint("appointment-booked-queue", endpoint =>
        {
            endpoint.ConfigureConsumer<AppointmentBookedConsumer>(context);
        });
    });
});

#endregion

var app = builder.Build();

#region Middleware

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();

    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint(
            "/swagger/v1/swagger.json",
            "HealthAxis API V1");

        options.RoutePrefix = string.Empty;
    });
}

app.UseSerilogRequestLogging();

app.UseMiddleware<ExceptionMiddleware>();

app.UseHttpsRedirection();

app.UseCors("BlazorPolicy");

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

#endregion

await app.RunAsync();

