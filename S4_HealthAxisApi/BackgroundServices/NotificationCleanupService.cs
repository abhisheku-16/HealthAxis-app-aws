using HealthAxis.API.Data;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;

namespace S4_HealthAxisApi.BackgroundServices
{
    [ExcludeFromCodeCoverage]
    public sealed class NotificationCleanupService : BackgroundService
    {
        private static readonly TimeSpan CleanupInterval = TimeSpan.FromHours(1);
        private static readonly TimeSpan NotificationRetentionPeriod = TimeSpan.FromDays(30);

        private readonly ILogger<NotificationCleanupService> _logger;
        private readonly IServiceScopeFactory _serviceScopeFactory;

        public NotificationCleanupService(
            ILogger<NotificationCleanupService> logger,
            IServiceScopeFactory serviceScopeFactory)
        {
            _logger = logger;
            _serviceScopeFactory = serviceScopeFactory;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("NotificationCleanupService started.");

            try
            {
                while (!stoppingToken.IsCancellationRequested)
                {
                    await DeleteOldNotificationsAsync(stoppingToken);

                    await Task.Delay(CleanupInterval, stoppingToken);
                }
            }
            catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("NotificationCleanupService cancellation requested.");
            }
            finally
            {
                _logger.LogInformation("NotificationCleanupService stopped.");
            }
        }

        private async Task DeleteOldNotificationsAsync(CancellationToken cancellationToken)
        {
            var cutoffDate = DateTime.UtcNow.Subtract(NotificationRetentionPeriod);

            using var scope = _serviceScopeFactory.CreateScope();

            var dbContext = scope.ServiceProvider.GetRequiredService<HealthAxisDbContext>();

            var oldNotifications = await dbContext.Notifications
                .Where(notification => notification.CreatedOn < cutoffDate)
                .ToListAsync(cancellationToken);

            if (oldNotifications.Count == 0)
            {
                _logger.LogInformation(
                    "Notification cleanup completed at {Timestamp}. No notifications older than {CutoffDate} were found.",
                    DateTimeOffset.Now,
                    cutoffDate);

                return;
            }

            dbContext.Notifications.RemoveRange(oldNotifications);

            await dbContext.SaveChangesAsync(cancellationToken);

            _logger.LogInformation(
                "Notification cleanup completed at {Timestamp}. Deleted {NotificationCount} notification(s) older than {CutoffDate}.",
                DateTimeOffset.Now,
                oldNotifications.Count,
                cutoffDate);
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("NotificationCleanupService is shutting down gracefully.");

            await base.StopAsync(cancellationToken);
        }
    }
}
