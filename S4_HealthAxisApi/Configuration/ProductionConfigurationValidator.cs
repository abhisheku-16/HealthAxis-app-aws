namespace S4_HealthAxisApi.Configuration;

public static class ProductionConfigurationValidator
{
    private static readonly string[] RequiredProductionKeys =
    [
        "ConnectionStrings:Default",
        "JwtSettings:Secret",
        "JwtSettings:Issuer",
        "JwtSettings:Audience",
        "RabbitMq:Host",
        "RabbitMq:Username",
        "RabbitMq:Password"
    ];

    public static void Validate(
        IConfiguration configuration,
        IHostEnvironment environment)
    {
        if (!environment.IsProduction())
        {
            return;
        }

        var missingKeys = RequiredProductionKeys
            .Where(key =>
                string.IsNullOrWhiteSpace(configuration[key]))
            .ToArray();

        if (missingKeys.Length > 0)
        {
            throw new InvalidOperationException(
                "The following required production configuration keys are missing: " +
                string.Join(", ", missingKeys));
        }

        ValidateJwtSecret(configuration);
        ValidateCorsOrigins(configuration);
    }

    private static void ValidateJwtSecret(
        IConfiguration configuration)
    {
        var jwtSecret =
            configuration["JwtSettings:Secret"] ?? string.Empty;

        if (jwtSecret.Length < 32)
        {
            throw new InvalidOperationException(
                "JwtSettings:Secret must contain at least 32 characters.");
        }
    }

    private static void ValidateCorsOrigins(
        IConfiguration configuration)
    {
        var allowedOrigins =
            configuration
                .GetSection("Cors:AllowedOrigins")
                .Get<string[]>() ?? [];

        if (allowedOrigins.Length == 0)
        {
            throw new InvalidOperationException(
                "At least one Cors:AllowedOrigins value must be configured.");
        }

        var invalidOrigins = allowedOrigins
            .Where(origin =>
                !Uri.TryCreate(
                    origin,
                    UriKind.Absolute,
                    out var uri) ||
                (uri.Scheme != Uri.UriSchemeHttp &&
                 uri.Scheme != Uri.UriSchemeHttps))
            .ToArray();

        if (invalidOrigins.Length > 0)
        {
            throw new InvalidOperationException(
                "Cors:AllowedOrigins contains invalid HTTP or HTTPS origins.");
        }
    }
}
