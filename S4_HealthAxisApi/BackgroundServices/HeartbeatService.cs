using System.Diagnostics.CodeAnalysis;

namespace S4_HealthAxisApi.BackgroundServices
{
    [ExcludeFromCodeCoverage]
    public sealed class HeartbeatService : BackgroundService
    {
        private static readonly TimeSpan HeartbeatInterval = TimeSpan.FromSeconds(600);

        private readonly ILogger<HeartbeatService> _logger;

        public HeartbeatService(ILogger<HeartbeatService> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("HeartbeatService started.");

            try
            {
                while (!stoppingToken.IsCancellationRequested)
                {
                    _logger.LogInformation(
                        "HealthAxis API heartbeat running at {Timestamp}.",
                        DateTimeOffset.Now);

                    await Task.Delay(HeartbeatInterval, stoppingToken);
                }
            }
            catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("HeartbeatService cancellation requested.");
            }
            finally
            {
                _logger.LogInformation("HeartbeatService stopped.");
            }
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("HeartbeatService is shutting down gracefully.");

            await base.StopAsync(cancellationToken);
        }
    }
}

