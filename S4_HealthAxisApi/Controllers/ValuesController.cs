using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using S4_HealthAxis.Shared.DTOs.Security;
using System.Security.Claims;

namespace S4_HealthAxisApi.Controllers
{
    [Route("api/security-audit")]
    [ApiController]
    [Authorize]
    public class SecurityAuditController : ControllerBase
    {
        private readonly ILogger<SecurityAuditController> _logger;

        public SecurityAuditController(
            ILogger<SecurityAuditController> logger)
        {
            _logger = logger;
        }

        [HttpPost("forbidden-access")]
        public IActionResult LogForbiddenAccess(
            [FromBody] ForbiddenAccessLogDto request)
        {
            var email =
                User.FindFirst(ClaimTypes.Email)?.Value ??
                User.FindFirst("email")?.Value ??
                "Unknown";

            var referenceId =
                User.FindFirst("ReferenceId")?.Value ??
                "N/A";

            _logger.LogWarning(
                """
                ====================================
                FORBIDDEN PAGE ACCESS ATTEMPT
                ====================================

                Email          : {Email}
                User Role      : {UserRole}
                Reference Id   : {ReferenceId}
                Attempted Path : {AttemptedPath}
                Required Roles : {RequiredRoles}

                ====================================
                """,
                email,
                request.UserRole,
                referenceId,
                request.AttemptedPath,
                string.Join(", ", request.RequiredRoles));

            return NoContent();
        }
    }
}