using MassTransit;
using S4_HealthAxisApi.Events;
using System.Diagnostics.CodeAnalysis;

namespace S4_HealthAxisApi.Consumers
{
    [ExcludeFromCodeCoverage]
    public class AppointmentBookedConsumer :
        IConsumer<AppointmentBookedEvent>
    {
        private readonly ILogger<AppointmentBookedConsumer> _logger;

        public AppointmentBookedConsumer(
            ILogger<AppointmentBookedConsumer> logger)
        {
            _logger = logger;
        }

        public Task Consume(
            ConsumeContext<AppointmentBookedEvent> context)
        {
            var message =
                context.Message;

            _logger.LogInformation(
                """
                ====================================
                APPOINTMENT EVENT RECEIVED
                ====================================

                Event Type    : {EventType}
                AppointmentId : {AppointmentId}
                Patient       : {PatientName}
                Doctor Id     : {DoctorId}
                Date          : {ScheduledDate:yyyy-MM-dd}
                Time Slot     : {TimeSlot}
                Message Id    : {MessageId}

                ====================================
                """,
                nameof(AppointmentBookedEvent),
                message.AppointmentId,
                message.PatientName,
                message.DoctorId,
                message.ScheduledDate,
                message.TimeSlot,
                context.MessageId?.ToString() ?? "N/A");

            return Task.CompletedTask;
        }
    }
}

