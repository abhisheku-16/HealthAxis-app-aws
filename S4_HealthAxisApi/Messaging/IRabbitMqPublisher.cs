namespace S4_HealthAxisApi.Messaging
{
    public interface IRabbitMqPublisher
    {
        Task PublishAsync<TMessage>(
            TMessage message,
            CancellationToken cancellationToken = default)
            where TMessage : class;
    }
}
