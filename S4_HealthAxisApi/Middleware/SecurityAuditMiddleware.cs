using System.Security.Claims;

namespace S4_HealthAxisApi.Middleware
{
    public class SecurityAuditMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<SecurityAuditMiddleware> _logger;

        public SecurityAuditMiddleware(
            RequestDelegate next,
            ILogger<SecurityAuditMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(
            HttpContext context)
        {
            await _next(context);

            if (context.Response.StatusCode != StatusCodes.Status401Unauthorized &&
                context.Response.StatusCode != StatusCodes.Status403Forbidden)
            {
                return;
            }

            var email =
                context.User.FindFirst(ClaimTypes.Email)?.Value ??
                context.User.FindFirst("email")?.Value ??
                "Unknown";

            var role =
                context.User.FindFirst(ClaimTypes.Role)?.Value ??
                "Unknown";

            var referenceId =
                context.User.FindFirst("ReferenceId")?.Value ??
                "N/A";

            _logger.LogWarning(
                """
                ====================================
                UNAUTHORIZED OR FORBIDDEN API ACCESS
                ====================================

                Status Code  : {StatusCode}
                Email        : {Email}
                User Role    : {UserRole}
                Reference Id : {ReferenceId}
                Path         : {RequestPath}
                Method       : {RequestMethod}
                Trace Id     : {TraceId}

                ====================================
                """,
                context.Response.StatusCode,
                email,
                role,
                referenceId,
                context.Request.Path.Value,
                context.Request.Method,
                context.TraceIdentifier);
        }
    }
}
