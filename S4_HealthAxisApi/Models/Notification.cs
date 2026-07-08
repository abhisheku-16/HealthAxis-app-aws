using System.ComponentModel.DataAnnotations;

namespace S4_HealthAxisApi.Models
{
    public class Notification
    {
        [Key]
        public int NotificationId { get; set; }

        public int DoctorId { get; set; }

        public int? AppointmentId { get; set; }

        [Required]
        [MaxLength(500)]
        public string Message { get; set; } = string.Empty;

        public bool IsRead { get; set; }

        public DateTime CreatedOn { get; set; } = DateTime.UtcNow;
    }
}
