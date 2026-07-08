using S4_HealthAxis.Blazor.Models;
using S4_HealthAxis.Shared.DTOs.Admin;

namespace S4_HealthAxis.Blazor.Services
{
    public interface IAdminService
    {
        Task<DashboardDto?> GetDashboardAsync();

        Task<StatisticsDto?> GetStatisticsAsync();

        Task<List<UserManagementDto>?> GetUsersAsync();
    }
}
