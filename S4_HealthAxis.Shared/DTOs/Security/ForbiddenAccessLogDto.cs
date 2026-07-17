namespace S4_HealthAxis.Shared.DTOs.Security
{
    public class ForbiddenAccessLogDto
    {
        public string AttemptedPath { get; set; } =
            string.Empty;

        public string UserRole { get; set; } =
            string.Empty;

        public List<string> RequiredRoles { get; set; } =
            [];
    }
}