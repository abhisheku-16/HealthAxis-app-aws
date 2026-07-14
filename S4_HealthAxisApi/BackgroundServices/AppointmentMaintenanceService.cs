using HealthAxis.API.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using S4_HealthAxis.Shared.Enums;

namespace S4_HealthAxisApi.BackgroundServices
{
    public sealed class AppointmentMaintenanceService : BackgroundService
    {
        private static readonly TimeSpan MaintenanceInterval = TimeSpan.FromHours(24);

        private const string PendingAutoCancellationReason =
            "Automatically cancelled because the appointment date has passed.";

        private const string ConfirmedAutoCancellationReason =
            "Automatically cancelled because the confirmed appointment was not completed before the due date.";

        private readonly ILogger<AppointmentMaintenanceService> _logger;
        private readonly IServiceScopeFactory _serviceScopeFactory;

        public AppointmentMaintenanceService(
            ILogger<AppointmentMaintenanceService> logger,
            IServiceScopeFactory serviceScopeFactory)
        {
            _logger = logger;
            _serviceScopeFactory = serviceScopeFactory;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("AppointmentMaintenanceService started.");

            try
            {
                while (!stoppingToken.IsCancellationRequested)
                {
                    await RunMaintenanceAsync(stoppingToken);

                    await Task.Delay(MaintenanceInterval, stoppingToken);
                }
            }
            catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("AppointmentMaintenanceService cancellation requested.");
            }
            finally
            {
                _logger.LogInformation("AppointmentMaintenanceService stopped.");
            }
        }

        private async Task RunMaintenanceAsync(CancellationToken cancellationToken)
        {
            try
            {
                using var scope = _serviceScopeFactory.CreateScope();

                var dbContext =
                    scope.ServiceProvider.GetRequiredService<HealthAxisDbContext>();

                var cache =
                    scope.ServiceProvider.GetRequiredService<IDistributedCache>();

                var today =
                    DateOnly.FromDateTime(DateTime.Today);

                var affectedAvailabilityCacheKeys =
                    await AutoCancelOverdueAppointmentsAsync(
                        dbContext,
                        today,
                        cancellationToken);

                if (affectedAvailabilityCacheKeys.Count > 0)
                {
                    await InvalidateAvailabilityCachesAsync(
                        cache,
                        affectedAvailabilityCacheKeys,
                        cancellationToken);
                }

                if (today.Day == 1)
                {
                    await DeleteOldCancelledAppointmentsAsync(
                        dbContext,
                        today,
                        cancellationToken);
                }

                _logger.LogInformation(
                    "Appointment maintenance completed at {Timestamp}.",
                    DateTimeOffset.Now);
            }
            catch (Exception ex)
            {
                _logger.LogError(
                    ex,
                    "Appointment maintenance failed at {Timestamp}.",
                    DateTimeOffset.Now);
            }
        }

        private async Task<HashSet<string>> AutoCancelOverdueAppointmentsAsync(
            HealthAxisDbContext dbContext,
            DateOnly today,
            CancellationToken cancellationToken)
        {
            var affectedCacheKeys = new HashSet<string>();

            var overdueAppointments = await dbContext.Appointments
                .Where(appointment =>
                    appointment.ScheduledDate < today &&
                    (
                        appointment.Status == AppointmentStatus.Pending ||
                        appointment.Status == AppointmentStatus.Confirmed
                    ))
                .ToListAsync(cancellationToken);

            if (overdueAppointments.Count == 0)
            {
                _logger.LogInformation(
                    "Auto-cancel overdue appointments completed. No overdue pending or confirmed appointments found before {Today}.",
                    today);

                return affectedCacheKeys;
            }

            foreach (var appointment in overdueAppointments)
            {
                if (appointment.Status == AppointmentStatus.Pending)
                {
                    appointment.Status = AppointmentStatus.Cancelled;
                    appointment.CancellationReason = PendingAutoCancellationReason;
                }
                else if (appointment.Status == AppointmentStatus.Confirmed)
                {
                    appointment.Status = AppointmentStatus.Cancelled;
                    appointment.CancellationReason = ConfirmedAutoCancellationReason;
                }

                affectedCacheKeys.Add(
                    BuildAvailabilityCacheKey(
                        appointment.DoctorId,
                        appointment.ScheduledDate));
            }

            await dbContext.SaveChangesAsync(cancellationToken);

            _logger.LogInformation(
                "Auto-cancel overdue appointments completed. Cancelled {AppointmentCount} appointment(s) before {Today}.",
                overdueAppointments.Count,
                today);

            return affectedCacheKeys;
        }

        private async Task DeleteOldCancelledAppointmentsAsync(
            HealthAxisDbContext dbContext,
            DateOnly today,
            CancellationToken cancellationToken)
        {
            var currentMonthStart =
                new DateOnly(today.Year, today.Month, 1);

            var targetMonthStart =
                currentMonthStart.AddMonths(-6);

            var targetMonthEndExclusive =
                targetMonthStart.AddMonths(1);

            var oldCancelledAppointments = await dbContext.Appointments
                .Where(appointment =>
                    appointment.Status == AppointmentStatus.Cancelled &&
                    appointment.ScheduledDate >= targetMonthStart &&
                    appointment.ScheduledDate < targetMonthEndExclusive)
                .ToListAsync(cancellationToken);

            if (oldCancelledAppointments.Count == 0)
            {
                _logger.LogInformation(
                    "Monthly cancelled appointment cleanup completed. No cancelled appointments found from {TargetMonthStart} to {TargetMonthEnd}.",
                    targetMonthStart,
                    targetMonthEndExclusive.AddDays(-1));

                return;
            }

            dbContext.Appointments.RemoveRange(oldCancelledAppointments);

            await dbContext.SaveChangesAsync(cancellationToken);

            _logger.LogInformation(
                "Monthly cancelled appointment cleanup completed. Deleted {AppointmentCount} cancelled appointment(s) from {TargetMonthStart} to {TargetMonthEnd}.",
                oldCancelledAppointments.Count,
                targetMonthStart,
                targetMonthEndExclusive.AddDays(-1));
        }

        private async Task InvalidateAvailabilityCachesAsync(
            IDistributedCache cache,
            HashSet<string> cacheKeys,
            CancellationToken cancellationToken)
        {
            foreach (var cacheKey in cacheKeys)
            {
                try
                {
                    await cache.RemoveAsync(
                        cacheKey,
                        cancellationToken);

                    _logger.LogInformation(
                        "Doctor availability cache invalidated by appointment maintenance. CacheKey {CacheKey}.",
                        cacheKey);
                }
                catch (Exception ex)
                {
                    _logger.LogWarning(
                        ex,
                        "Failed to invalidate doctor availability cache during appointment maintenance. CacheKey {CacheKey}.",
                        cacheKey);
                }
            }
        }

        private static string BuildAvailabilityCacheKey(
            int doctorId,
            DateOnly date)
        {
            return $"doctors:{doctorId}:availability:{date:yyyy-MM-dd}";
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("AppointmentMaintenanceService is shutting down gracefully.");

            await base.StopAsync(cancellationToken);
        }
    }
}