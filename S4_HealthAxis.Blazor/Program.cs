using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using S4_HealthAxis.Blazor;
using S4_HealthAxis.Blazor.Services;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddAuthorizationCore();

var hostBaseUri =
    new Uri(builder.HostEnvironment.BaseAddress);

var originRoot =
    new Uri(hostBaseUri.GetLeftPart(UriPartial.Authority) + "/");

var configuredApiBaseUrl =
    builder.Configuration["ApiSettings:BaseUrl"];

Uri apiBaseUri;

if (string.IsNullOrWhiteSpace(configuredApiBaseUrl))
{
    apiBaseUri = originRoot;
}
else if (Uri.TryCreate(configuredApiBaseUrl, UriKind.Absolute, out var absoluteApiUri))
{
    apiBaseUri = absoluteApiUri;
}
else
{
    apiBaseUri = new Uri(originRoot, configuredApiBaseUrl.TrimStart('/'));
}

builder.Services.AddScoped(_ =>
    new HttpClient
    {
        BaseAddress = apiBaseUri
    });

builder.Services.AddScoped<
    AuthenticationStateProvider,
    CustomAuthStateProvider>();

builder.Services.AddTransient<TokenAuthenticationHandler>();

builder.Services
    .AddHttpClient("HealthAxisAPI", client =>
    {
        client.BaseAddress = apiBaseUri;
    })
    .AddHttpMessageHandler<TokenAuthenticationHandler>();

builder.Services.AddScoped<IAuthService, AuthService>();

builder.Services.AddScoped<IAdminService>(sp =>
{
    var httpClientFactory =
        sp.GetRequiredService<IHttpClientFactory>();

    var client =
        httpClientFactory.CreateClient("HealthAxisAPI");

    return new AdminService(client);
});

builder.Services.AddScoped<IDoctorService>(sp =>
{
    var httpClientFactory =
        sp.GetRequiredService<IHttpClientFactory>();

    var client =
        httpClientFactory.CreateClient("HealthAxisAPI");

    return new DoctorService(client);
});

builder.Services.AddScoped<IPatientService>(sp =>
{
    var httpClientFactory =
        sp.GetRequiredService<IHttpClientFactory>();

    var client =
        httpClientFactory.CreateClient("HealthAxisAPI");

    return new PatientService(client);
});

builder.Services.AddScoped<IAppointmentService>(sp =>
{
    var httpClientFactory =
        sp.GetRequiredService<IHttpClientFactory>();

    var client =
        httpClientFactory.CreateClient("HealthAxisAPI");

    return new AppointmentService(client);
});

await builder.Build().RunAsync();