using MassTransit;
using System.Diagnostics.CodeAnalysis;

namespace S4_HealthAxisApi.Messaging
{
    [ExcludeFromCodeCoverage]
    public sealed class RabbitMqPublisher : IRabbitMqPublisher
    {
        private readonly IPublishEndpoint _publishEndpoint;
        private readonly ILogger<RabbitMqPublisher> _logger;

        public RabbitMqPublisher(
            IPublishEndpoint publishEndpoint,
            ILogger<RabbitMqPublisher> logger)
        {
            _publishEndpoint = publishEndpoint;
            _logger = logger;
        }

        public async Task PublishAsync<TMessage>(
            TMessage message,
            CancellationToken cancellationToken = default)
            where TMessage : class
        {
            await _publishEndpoint.Publish(
                message,
                cancellationToken);

            _logger.LogInformation(
                "RabbitMQ message published. MessageType {MessageType}.",
                typeof(TMessage).Name);
        }
    }
}
