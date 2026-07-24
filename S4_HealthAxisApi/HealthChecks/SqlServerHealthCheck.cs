using HealthAxis.API.Data;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace S4_HealthAxisApi.HealthChecks;

public sealed class SqlServerHealthCheck
    : IHealthCheck
{
    private readonly HealthAxisDbContext _dbContext;
    private readonly ILogger<SqlServerHealthCheck> _logger;

    public SqlServerHealthCheck(
        HealthAxisDbContext dbContext,
        ILogger<SqlServerHealthCheck> logger)
    {
        _dbContext = dbContext;
        _logger = logger;
    }

    public async Task<HealthCheckResult> CheckHealthAsync(
        HealthCheckContext context,
        CancellationToken cancellationToken = default)
    {
        try
        {
            var canConnect =
                await _dbContext.Database.CanConnectAsync(
                    cancellationToken);

            return canConnect
                ? HealthCheckResult.Healthy(
                    "SQL Server connection is available.")
                : HealthCheckResult.Unhealthy(
                    "SQL Server connection is unavailable.");
        }
        catch (Exception exception)
        {
            _logger.LogError(
                exception,
                "SQL Server readiness health check failed.");

            return HealthCheckResult.Unhealthy(
                "SQL Server readiness check failed.");
        }
    }
}

