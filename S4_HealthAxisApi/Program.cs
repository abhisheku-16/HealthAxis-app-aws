using Elastic.Ingest.Elasticsearch;
using Elastic.Ingest.Elasticsearch.DataStreams;
using Elastic.Serilog.Sinks;
using HealthAxis.API.Data;
using MassTransit;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi;
using S4_HealthAxisApi.BackgroundServices;
using S4_HealthAxisApi.Configuration;
using S4_HealthAxisApi.Consumers;
using S4_HealthAxisApi.HealthChecks;
using S4_HealthAxisApi.Middleware;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Implementation;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using S4_HealthAxisApi.Services.Interface;
using Serilog;
using System.Text;
using System.Text.Json;

var builder = WebApplication.CreateBuilder(args);

ProductionConfigurationValidator.Validate(
    builder.Configuration,
    builder.Environment);

#region Serilog And Elasticsearch Logging

builder.Host.UseSerilog((context, services, configuration) =>
{
    var elasticSection =
        context.Configuration.GetSection("ElasticSearch");

    var elasticEnabled =
        bool.TryParse(
            elasticSection["Enabled"],
            out var enabled) &&
        enabled;

    var elasticUri =
        elasticSection["Uri"];

    var dataStreamDataset =
        elasticSection["DataStreamDataset"] ??
        "healthaxis-api";

    var dataStreamNamespace =
        elasticSection["DataStreamNamespace"] ??
        "local";

    const string outputTemplate =
        "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] " +
        "{Message:lj}{NewLine}{Exception}";

    configuration
        .ReadFrom.Configuration(context.Configuration)
        .ReadFrom.Services(services)
        .Enrich.FromLogContext()
        .Enrich.WithProperty(
            "Application",
            "S4_HealthAxisApi")
        .WriteTo.Console(
            outputTemplate: outputTemplate)
        .WriteTo.File(
            "logs/healthaxis-.log",
            rollingInterval: RollingInterval.Day,
            retainedFileCountLimit: 7,
            outputTemplate: outputTemplate);

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

#endregion

#region Controllers

builder.Services
    .AddControllers()
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
            Description =
                "Healthcare Appointment Management API"
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
            Description =
                "Enter JWT token. Example: Bearer eyJhbGciOi..."
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

var databaseConnectionString =
    builder.Configuration.GetConnectionString("Default");

if (string.IsNullOrWhiteSpace(databaseConnectionString))
{
    throw new InvalidOperationException(
        "ConnectionStrings:Default is missing.");
}

builder.Services.AddDbContext<HealthAxisDbContext>(options =>
{
    options.UseSqlServer(databaseConnectionString);
});

#endregion

#region Health Checks

builder.Services
    .AddHealthChecks()
    .AddCheck(
        "self",
        () => HealthCheckResult.Healthy(
            "HealthAxis API is running."),
        tags: ["live"])
    .AddCheck<SqlServerHealthCheck>(
        "sql-server",
        tags: ["ready"]);

#endregion

#region JWT Authentication

var jwtSection =
    builder.Configuration.GetSection("JwtSettings");

var jwtSecret =
    jwtSection["Secret"];

if (string.IsNullOrWhiteSpace(jwtSecret))
{
    throw new InvalidOperationException(
        "JwtSettings:Secret is missing. " +
        "Configure it with .NET User Secrets for local development.");
}

if (jwtSecret.Length < 32)
{
    throw new InvalidOperationException(
        "JwtSettings:Secret must contain at least 32 characters.");
}

var jwtIssuer =
    jwtSection["Issuer"];

var jwtAudience =
    jwtSection["Audience"];

if (string.IsNullOrWhiteSpace(jwtIssuer))
{
    throw new InvalidOperationException(
        "JwtSettings:Issuer is missing.");
}

if (string.IsNullOrWhiteSpace(jwtAudience))
{
    throw new InvalidOperationException(
        "JwtSettings:Audience is missing.");
}

builder.Services
    .AddAuthentication(
        JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters =
            new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwtIssuer,

                ValidateAudience = true,
                ValidAudience = jwtAudience,

                ValidateLifetime = true,

                ValidateIssuerSigningKey = true,
                IssuerSigningKey =
                    new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(jwtSecret)),

                ClockSkew = TimeSpan.Zero
            };
    });

builder.Services.AddAuthorization();

#endregion

#region CORS

var allowedOrigins =
    builder.Configuration
        .GetSection("Cors:AllowedOrigins")
        .Get<string[]>() ?? [];

if (allowedOrigins.Length == 0)
{
    throw new InvalidOperationException(
        "Cors:AllowedOrigins must contain at least one origin.");
}

builder.Services.AddCors(options =>
{
    options.AddPolicy(
        "FrontendPolicy",
        policy =>
        {
            policy
                .WithOrigins(allowedOrigins)
                .AllowAnyHeader()
                .AllowAnyMethod();
        });
});

#endregion

#region Forwarded Headers

builder.Services.Configure<ForwardedHeadersOptions>(
    options =>
    {
        options.ForwardedHeaders =
            ForwardedHeaders.XForwardedFor |
            ForwardedHeaders.XForwardedProto;
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

#endregion

#region Background Services

builder.Services.AddHostedService<HeartbeatService>();
builder.Services.AddHostedService<NotificationCleanupService>();
builder.Services.AddHostedService<AppointmentMaintenanceService>();

#endregion

#region MassTransit RabbitMQ

var rabbitMqSection =
    builder.Configuration.GetSection("RabbitMq");

var rabbitMqHost =
    rabbitMqSection["Host"];

var rabbitMqUsername =
    rabbitMqSection["Username"];

var rabbitMqPassword =
    rabbitMqSection["Password"];

var rabbitMqVirtualHost =
    rabbitMqSection["VirtualHost"] ?? "/";

var appointmentQueue =
    rabbitMqSection["AppointmentQueue"] ??
    "appointment-booked-queue";

var rabbitMqUseSsl =
    bool.TryParse(
        rabbitMqSection["UseSsl"],
        out var useSsl) &&
    useSsl;

var rabbitMqPort =
    int.TryParse(
        rabbitMqSection["Port"],
        out var parsedRabbitMqPort)
        ? parsedRabbitMqPort
        : rabbitMqUseSsl ? 5671 : 5672;

if (string.IsNullOrWhiteSpace(rabbitMqHost))
{
    throw new InvalidOperationException(
        "RabbitMq:Host is missing.");
}

if (string.IsNullOrWhiteSpace(rabbitMqUsername))
{
    throw new InvalidOperationException(
        "RabbitMq:Username is missing.");
}

if (string.IsNullOrWhiteSpace(rabbitMqPassword))
{
    throw new InvalidOperationException(
        "RabbitMq:Password is missing.");
}

var rabbitMqScheme =
    rabbitMqUseSsl
        ? "rabbitmqs"
        : "rabbitmq";

var rabbitMqVirtualHostPath =
    rabbitMqVirtualHost == "/"
        ? string.Empty
        : "/" + Uri.EscapeDataString(
            rabbitMqVirtualHost.Trim('/'));

var rabbitMqUri =
    new Uri(
        $"{rabbitMqScheme}://{rabbitMqHost}:{rabbitMqPort}{rabbitMqVirtualHostPath}");

builder.Services.AddMassTransit(options =>
{
    options.AddConsumer<AppointmentBookedConsumer>();

    options.UsingRabbitMq((context, cfg) =>
    {
        cfg.Host(
            rabbitMqUri,
            host =>
            {
                host.Username(rabbitMqUsername);
                host.Password(rabbitMqPassword);

                if (rabbitMqUseSsl)
                {
                    host.UseSsl(ssl =>
                    {
                        ssl.Protocol =
                            System.Security.Authentication
                                .SslProtocols.Tls12;
                    });
                }
            });

        cfg.ReceiveEndpoint(
            appointmentQueue,
            endpoint =>
            {
                endpoint.ConfigureConsumer<AppointmentBookedConsumer>(
                    context);
            });
    });
});

#endregion

var app = builder.Build();

#region Middleware Pipeline

app.UseForwardedHeaders();

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

var contentTypeProvider =
    new FileExtensionContentTypeProvider();

contentTypeProvider.Mappings[".dat"] =
    "application/octet-stream";

contentTypeProvider.Mappings[".wasm"] =
    "application/wasm";

contentTypeProvider.Mappings[".dll"] =
    "application/octet-stream";

contentTypeProvider.Mappings[".pdb"] =
    "application/octet-stream";

contentTypeProvider.Mappings[".blat"] =
    "application/octet-stream";

app.UseStaticFiles(
    new StaticFileOptions
    {
        ContentTypeProvider = contentTypeProvider
    });

app.UseCors("FrontendPolicy");

app.UseAuthentication();

app.UseMiddleware<SecurityAuditMiddleware>();

app.UseAuthorization();

app.MapControllers();

app.MapHealthChecks(
    "/health",
    new HealthCheckOptions
    {
        Predicate =
            healthCheck =>
                healthCheck.Tags.Contains("live")
    });

app.MapHealthChecks(
    "/health/ready",
    new HealthCheckOptions
    {
        Predicate =
            healthCheck =>
                healthCheck.Tags.Contains("ready")
    });

if (!app.Environment.IsDevelopment())
{
    app.MapGet("/", context =>
    {
        context.Response.Redirect("/Angular/");
        return Task.CompletedTask;
    });
}

app.MapGet(
    "/Angular",
    async context =>
    {
        await context.Response.SendFileAsync(
            Path.Combine(
                app.Environment.WebRootPath,
                "Angular",
                "index.html"));
    });

app.MapGet(
    "/Angular/{*path:nonfile}",
    async context =>
    {
        await context.Response.SendFileAsync(
            Path.Combine(
                app.Environment.WebRootPath,
                "Angular",
                "index.html"));
    });

if (File.Exists(
        Path.Combine(
            app.Environment.WebRootPath,
            "Blazor",
            "index.html")))
{
    app.MapGet(
        "/Blazor",
        async context =>
        {
            await context.Response.SendFileAsync(
                Path.Combine(
                    app.Environment.WebRootPath,
                    "Blazor",
                    "index.html"));
        });

    app.MapGet(
        "/Blazor/{*path:nonfile}",
        async context =>
        {
            await context.Response.SendFileAsync(
                Path.Combine(
                    app.Environment.WebRootPath,
                    "Blazor",
                    "index.html"));
        });
}

#endregion

await app.RunAsync();