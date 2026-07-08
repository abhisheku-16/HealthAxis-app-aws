using S4_HealthAxis.Shared.DTOs.HealthRecord;

namespace S4_HealthAxisApi.Services.Interface
{
    public interface IHealthRecordService
    {
        Task<HealthRecordDto?> GetByIdAsync(int id);

        Task<HealthRecordDto?> GetByAppointmentIdAsync(int appointmentId);

        Task<IEnumerable<HealthRecordDto>> GetByPatientIdAsync(int patientId);

        Task<HealthRecordDto> CreateAsync(CreateHealthRecordDto dto);

        Task UpdateAsync(int id, UpdateHealthRecordDto dto);
    }
}
