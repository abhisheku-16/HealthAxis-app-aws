using Microsoft.Extensions.Caching.Distributed;
using S4_HealthAxis.Shared.DTOs.Appointment;
using S4_HealthAxis.Shared.DTOs.Doctor;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Events;
using S4_HealthAxisApi.Messaging;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Interface;

namespace S4_HealthAxisApi.Services.Implementation
{
    public class AppointmentService : IAppointmentService
    {
        private readonly IAppointmentRepository _appointmentRepository;
        private readonly IPatientRepository _patientRepository;
        private readonly IDoctorRepository _doctorRepository;
        private readonly IRabbitMqPublisher _rabbitMqPublisher;
        private readonly ILogger<AppointmentService> _logger;
        private readonly IDistributedCache _cache;

        public AppointmentService(
            IAppointmentRepository appointmentRepository,
            IPatientRepository patientRepository,
            IDoctorRepository doctorRepository,
            IRabbitMqPublisher rabbitMqPublisher,
            ILogger<AppointmentService> logger,
            IDistributedCache cache)
        {
            _appointmentRepository = appointmentRepository;
            _patientRepository = patientRepository;
            _doctorRepository = doctorRepository;
            _rabbitMqPublisher = rabbitMqPublisher;
            _logger = logger;
            _cache = cache;
        }

        public async Task<IEnumerable<AppointmentDetailsDto>> GetAllAsync()
        {
            var appointments = await _appointmentRepository.GetAllAsync();

            return appointments.Select(MapToAppointmentDetailsDto);
        }

        public async Task<AppointmentDetailsDto?> GetByIdAsync(int id)
        {
            var appointment = await _appointmentRepository.GetByIdAsync(id);

            if (appointment == null)
            {
                return null;
            }

            return MapToAppointmentDetailsDto(appointment);
        }

        public async Task<IEnumerable<PatientAppointmentHistoryDto>> GetPatientHistoryAsync(int patientId)
        {
            var appointments = await _appointmentRepository.GetByPatientIdAsync(patientId);

            return appointments.Select(a => new PatientAppointmentHistoryDto
            {
                AppointmentId = a.AppointmentId,
                ScheduledDate = a.ScheduledDate,
                TimeSlot = (int)a.TimeSlot,
                DoctorId = a.DoctorId,
                DoctorName = a.Doctor.FullName,
                Status = (int)a.Status
            });
        }

        public async Task<IEnumerable<DoctorScheduleItemDto>> GetDoctorTodayScheduleAsync(int doctorId)
        {
            var appointments =
                await _appointmentRepository.GetDoctorTodayScheduleAsync(
                    doctorId,
                    DateOnly.FromDateTime(DateTime.Today));

            return appointments.Select(MapDoctorScheduleItem);
        }

        public async Task<IEnumerable<DoctorScheduleItemDto>> GetDoctorWeekScheduleAsync(
            int doctorId,
            DateOnly startDate,
            DateOnly endDate)
        {
            var appointments =
                await _appointmentRepository.GetDoctorWeekScheduleAsync(
                    doctorId,
                    startDate,
                    endDate);

            return appointments.Select(MapDoctorScheduleItem);
        }

        public async Task<AppointmentDto> CreateAsync(CreateAppointmentDto dto)
        {
            await ValidateBookingAsync(
                dto.PatientId,
                dto.DoctorId,
                dto.ScheduledDate,
                dto.TimeSlot);

            var appointment = new Appointment
            {
                PatientId = dto.PatientId,
                DoctorId = dto.DoctorId,
                ScheduledDate = dto.ScheduledDate,
                TimeSlot = (AppointmentTimeSlot)dto.TimeSlot,
                Status = AppointmentStatus.Pending
            };

            await _appointmentRepository.AddAsync(appointment);
            await _appointmentRepository.SaveChangesAsync();

            await InvalidateDoctorAvailabilityCacheAsync(
                appointment.DoctorId,
                appointment.ScheduledDate);

            var patient = await _patientRepository.GetByIdAsync(dto.PatientId);

            await _rabbitMqPublisher.PublishAsync(
                new AppointmentBookedEvent
                {
                    AppointmentId = appointment.AppointmentId,
                    PatientName = patient?.FullName ?? "Patient",
                    DoctorId = appointment.DoctorId,
                    ScheduledDate = appointment.ScheduledDate,
                    TimeSlot = appointment.TimeSlot.ToString()
                });

            _logger.LogInformation(
                "Appointment booked successfully. AppointmentId {AppointmentId}, PatientId {PatientId}, DoctorId {DoctorId}, ScheduledDate {ScheduledDate}, TimeSlot {TimeSlot}.",
                appointment.AppointmentId,
                appointment.PatientId,
                appointment.DoctorId,
                appointment.ScheduledDate,
                appointment.TimeSlot);

            _logger.LogInformation(
                "AppointmentBookedEvent published for AppointmentId {AppointmentId}, PatientId {PatientId}, DoctorId {DoctorId}.",
                appointment.AppointmentId,
                appointment.PatientId,
                appointment.DoctorId);

            return MapToAppointmentDto(appointment);
        }

        public async Task UpdateAsync(int id, UpdateAppointmentDto dto)
        {
            var appointment = await _appointmentRepository.GetByIdAsync(id);

            if (appointment == null)
            {
                throw new KeyNotFoundException($"Appointment {id} not found.");
            }

            if (appointment.Status == AppointmentStatus.Completed)
            {
                throw new InvalidOperationException("Completed appointments cannot be modified.");
            }

            if (appointment.Status == AppointmentStatus.Cancelled)
            {
                throw new InvalidOperationException("Cancelled appointments cannot be modified.");
            }

            await ValidateUpdateBookingAsync(
                appointment.AppointmentId,
                appointment.PatientId,
                dto.DoctorId,
                dto.ScheduledDate,
                dto.TimeSlot);

            var oldDoctorId = appointment.DoctorId;
            var oldScheduledDate = appointment.ScheduledDate;

            appointment.DoctorId = dto.DoctorId;
            appointment.ScheduledDate = dto.ScheduledDate;
            appointment.TimeSlot = (AppointmentTimeSlot)dto.TimeSlot;

            await _appointmentRepository.UpdateAsync(appointment);
            await _appointmentRepository.SaveChangesAsync();

            await InvalidateDoctorAvailabilityCacheAsync(
                oldDoctorId,
                oldScheduledDate);

            await InvalidateDoctorAvailabilityCacheAsync(
                appointment.DoctorId,
                appointment.ScheduledDate);
        }

        public async Task UpdateStatusAsync(int id, UpdateAppointmentStatusDto dto)
        {
            var appointment = await _appointmentRepository.GetByIdAsync(id);

            if (appointment == null)
            {
                throw new KeyNotFoundException($"Appointment {id} not found.");
            }

            if (!Enum.IsDefined(typeof(AppointmentStatus), dto.Status))
            {
                throw new ArgumentException("Invalid appointment status.");
            }

            var newStatus = (AppointmentStatus)dto.Status;
            var shouldInvalidateAvailabilityCache = false;

            if (appointment.Status == AppointmentStatus.Completed)
            {
                throw new InvalidOperationException("Completed appointments cannot be modified.");
            }

            if (appointment.Status == AppointmentStatus.Cancelled)
            {
                throw new InvalidOperationException("Cancelled appointments cannot be modified.");
            }

            switch (newStatus)
            {
                case AppointmentStatus.Pending:
                    throw new InvalidOperationException("Cannot manually change appointment back to Pending.");

                case AppointmentStatus.Confirmed:
                    if (appointment.Status != AppointmentStatus.Pending)
                    {
                        throw new InvalidOperationException("Only pending appointments can be confirmed.");
                    }

                    appointment.Status = AppointmentStatus.Confirmed;
                    break;

                case AppointmentStatus.Completed:
                    if (appointment.Status != AppointmentStatus.Confirmed)
                    {
                        throw new InvalidOperationException("Only confirmed appointments can be completed.");
                    }

                    appointment.Status = AppointmentStatus.Completed;
                    break;

                case AppointmentStatus.Cancelled:
                    if (string.IsNullOrWhiteSpace(dto.CancellationReason))
                    {
                        throw new ArgumentException("Cancellation reason is required.");
                    }

                    appointment.Status = AppointmentStatus.Cancelled;
                    appointment.CancellationReason = dto.CancellationReason.Trim();
                    shouldInvalidateAvailabilityCache = true;
                    break;

                default:
                    throw new ArgumentException("Invalid appointment status.");
            }

            await _appointmentRepository.UpdateAsync(appointment);
            await _appointmentRepository.SaveChangesAsync();

            if (shouldInvalidateAvailabilityCache)
            {
                await InvalidateDoctorAvailabilityCacheAsync(
                    appointment.DoctorId,
                    appointment.ScheduledDate);
            }
        }

        public async Task ConfirmAsync(int id)
        {
            var appointment = await _appointmentRepository.GetByIdAsync(id);

            if (appointment == null)
            {
                throw new KeyNotFoundException();
            }

            if (appointment.Status != AppointmentStatus.Pending)
            {
                throw new InvalidOperationException("Only pending appointments can be confirmed.");
            }

            appointment.Status = AppointmentStatus.Confirmed;

            await _appointmentRepository.UpdateAsync(appointment);
            await _appointmentRepository.SaveChangesAsync();
        }

        public async Task CompleteAsync(int id)
        {
            var appointment = await _appointmentRepository.GetByIdAsync(id);

            if (appointment == null)
            {
                throw new KeyNotFoundException();
            }

            if (appointment.Status != AppointmentStatus.Confirmed)
            {
                throw new InvalidOperationException("Only confirmed appointments can be completed.");
            }

            appointment.Status = AppointmentStatus.Completed;

            await _appointmentRepository.UpdateAsync(appointment);
            await _appointmentRepository.SaveChangesAsync();
        }

        public async Task CancelAsync(int id, CancelAppointmentDto dto)
        {
            var appointment = await _appointmentRepository.GetByIdAsync(id);

            if (appointment == null)
            {
                throw new KeyNotFoundException();
            }

            if (appointment.Status == AppointmentStatus.Completed)
            {
                throw new InvalidOperationException("Completed appointments cannot be cancelled.");
            }

            if (appointment.Status == AppointmentStatus.Cancelled)
            {
                throw new InvalidOperationException("Appointment already cancelled.");
            }

            if (string.IsNullOrWhiteSpace(dto.CancellationReason))
            {
                throw new ArgumentException("Cancellation reason is required.");
            }

            appointment.Status = AppointmentStatus.Cancelled;
            appointment.CancellationReason = dto.CancellationReason.Trim();

            await _appointmentRepository.UpdateAsync(appointment);
            await _appointmentRepository.SaveChangesAsync();

            await InvalidateDoctorAvailabilityCacheAsync(
                appointment.DoctorId,
                appointment.ScheduledDate);
        }

        public async Task<IEnumerable<DoctorScheduleItemDto>> GetDoctorUpcomingScheduleAsync(int doctorId)
        {
            var startDate = DateOnly.FromDateTime(DateTime.Today);
            var endDate = startDate.AddDays(7);

            var appointments =
                await _appointmentRepository.GetDoctorWeekScheduleAsync(
                    doctorId,
                    startDate,
                    endDate);

            return appointments.Select(MapDoctorScheduleItem);
        }

        public async Task<IEnumerable<DoctorPatientDto>> GetDoctorPatientsAsync(int doctorId)
        {
            var doctor = await _doctorRepository.GetByIdAsync(doctorId);

            if (doctor == null)
            {
                throw new KeyNotFoundException($"Doctor with Id {doctorId} not found.");
            }

            var appointments =
                await _appointmentRepository.GetDoctorPatientAppointmentsAsync(doctorId);

            var patients = appointments
                .Where(a => a.Patient != null)
                .GroupBy(a => a.PatientId)
                .Select(group =>
                {
                    var latestAppointment = group
                        .OrderByDescending(a => a.ScheduledDate)
                        .ThenByDescending(a => a.TimeSlot)
                        .First();

                    var patient = latestAppointment.Patient;

                    return new DoctorPatientDto
                    {
                        PatientId = patient.PatientId,
                        FullName = patient.FullName,
                        DateOfBirth = patient.DateOfBirth,
                        Gender = patient.Gender,
                        PhoneNumber = patient.PhoneNumber,
                        Email = patient.Email,
                        InsuranceId = patient.InsuranceNumber,
                        IsActive = patient.IsActive,
                        TotalAppointments = group.Count(),
                        LastVisitDate = latestAppointment.ScheduledDate
                    };
                })
                .OrderBy(p => p.FullName)
                .ToList();

            return patients;
        }

        private async Task ValidateBookingAsync(
            int patientId,
            int doctorId,
            DateOnly date,
            int timeSlot)
        {
            var patient = await _patientRepository.GetByIdAsync(patientId);

            if (patient == null)
            {
                throw new KeyNotFoundException("Patient not found.");
            }

            if (!patient.IsActive)
            {
                throw new InvalidOperationException("Inactive patients cannot book appointments.");
            }

            var doctor = await _doctorRepository.GetByIdAsync(doctorId);

            if (doctor == null)
            {
                throw new KeyNotFoundException("Doctor not found.");
            }

            if (!doctor.IsActive)
            {
                throw new InvalidOperationException("Inactive doctor.");
            }

            ValidateBookingDateAndSlot(date, timeSlot);

            if (await _appointmentRepository.ExistsSamePatientSameDoctorSameDateAsync(patientId, doctorId, date))
            {
                throw new InvalidOperationException("Patient already has an appointment with this doctor on the selected date.");
            }

            if (await _appointmentRepository.ExistsSamePatientSameSlotSameDateAsync(patientId, date, timeSlot))
            {
                throw new InvalidOperationException("Patient already has another appointment in this time slot.");
            }

            if (await _appointmentRepository.ExistsSameDoctorSameSlotSameDateAsync(doctorId, date, timeSlot))
            {
                throw new InvalidOperationException("Doctor is already booked for this time slot.");
            }
        }

        private async Task ValidateUpdateBookingAsync(
            int appointmentId,
            int patientId,
            int doctorId,
            DateOnly date,
            int timeSlot)
        {
            var patient = await _patientRepository.GetByIdAsync(patientId);

            if (patient == null)
            {
                throw new KeyNotFoundException("Patient not found.");
            }

            if (!patient.IsActive)
            {
                throw new InvalidOperationException("Inactive patients cannot book appointments.");
            }

            var doctor = await _doctorRepository.GetByIdAsync(doctorId);

            if (doctor == null)
            {
                throw new KeyNotFoundException("Doctor not found.");
            }

            if (!doctor.IsActive)
            {
                throw new InvalidOperationException("Inactive doctor.");
            }

            ValidateBookingDateAndSlot(date, timeSlot);

            if (await _appointmentRepository.ExistsSamePatientSameDoctorSameDateAsync(patientId, doctorId, date, appointmentId))
            {
                throw new InvalidOperationException("Patient already has an appointment with this doctor on the selected date.");
            }

            if (await _appointmentRepository.ExistsSamePatientSameSlotSameDateAsync(patientId, date, timeSlot, appointmentId))
            {
                throw new InvalidOperationException("Patient already has another appointment in this time slot.");
            }

            if (await _appointmentRepository.ExistsSameDoctorSameSlotSameDateAsync(doctorId, date, timeSlot, appointmentId))
            {
                throw new InvalidOperationException("Doctor is already booked for this time slot.");
            }
        }

        private async Task InvalidateDoctorAvailabilityCacheAsync(
            int doctorId,
            DateOnly date)
        {
            var cacheKey = BuildAvailabilityCacheKey(
                doctorId,
                date);

            await _cache.RemoveAsync(cacheKey);

            _logger.LogInformation(
                "Doctor availability cache invalidated. DoctorId {DoctorId}, Date {Date}, CacheKey {CacheKey}.",
                doctorId,
                date,
                cacheKey);
        }

        private static string BuildAvailabilityCacheKey(
            int doctorId,
            DateOnly date)
        {
            return $"doctors:{doctorId}:availability:{date:yyyy-MM-dd}";
        }

        private static void ValidateBookingDateAndSlot(DateOnly date, int timeSlot)
        {
            var today = DateOnly.FromDateTime(DateTime.Today);
            var maxBookingDate = today.AddDays(30);

            if (date < today)
            {
                throw new ArgumentException("Appointment date cannot be in the past.");
            }

            if (date > maxBookingDate)
            {
                throw new ArgumentException("Appointments can be booked only for the next 30 days.");
            }

            if (!Enum.IsDefined(typeof(AppointmentTimeSlot), timeSlot))
            {
                throw new ArgumentException("Invalid appointment slot.");
            }

            var slotEnum = (AppointmentTimeSlot)timeSlot;

            if (date == today)
            {
                var now = TimeOnly.FromDateTime(DateTime.Now);
                var slotStartTime = GetSlotStartTime(slotEnum);

                if (slotStartTime < now)
                {
                    throw new InvalidOperationException("Selected time slot has already passed.");
                }
            }
        }

        private static TimeOnly GetSlotStartTime(AppointmentTimeSlot slot)
        {
            return slot switch
            {
                AppointmentTimeSlot.TenAM => new TimeOnly(10, 0),
                AppointmentTimeSlot.TenThirtyAM => new TimeOnly(10, 30),
                AppointmentTimeSlot.ElevenAM => new TimeOnly(11, 0),
                AppointmentTimeSlot.ElevenThirtyAM => new TimeOnly(11, 30),
                AppointmentTimeSlot.TwelvePM => new TimeOnly(12, 0),
                AppointmentTimeSlot.TwelveThirtyPM => new TimeOnly(12, 30),
                AppointmentTimeSlot.OnePM => new TimeOnly(13, 0),
                AppointmentTimeSlot.OneThirtyPM => new TimeOnly(13, 30),
                AppointmentTimeSlot.TwoPM => new TimeOnly(14, 0),
                AppointmentTimeSlot.TwoThirtyPM => new TimeOnly(14, 30),
                AppointmentTimeSlot.ThreePM => new TimeOnly(15, 0),
                AppointmentTimeSlot.ThreeThirtyPM => new TimeOnly(15, 30),
                _ => TimeOnly.MinValue
            };
        }

        private static AppointmentDto MapToAppointmentDto(Appointment appointment)
        {
            return new AppointmentDto
            {
                AppointmentId = appointment.AppointmentId,
                PatientId = appointment.PatientId,
                DoctorId = appointment.DoctorId,
                ScheduledDate = appointment.ScheduledDate,
                TimeSlot = (int)appointment.TimeSlot,
                Status = (int)appointment.Status,
                CancellationReason = appointment.CancellationReason
            };
        }

        private static AppointmentDetailsDto MapToAppointmentDetailsDto(Appointment appointment)
        {
            return new AppointmentDetailsDto
            {
                AppointmentId = appointment.AppointmentId,
                PatientId = appointment.PatientId,
                PatientName = appointment.Patient?.FullName ?? string.Empty,
                DoctorId = appointment.DoctorId,
                DoctorName = appointment.Doctor?.FullName ?? string.Empty,
                ScheduledDate = appointment.ScheduledDate,
                TimeSlot = (int)appointment.TimeSlot,
                Status = (int)appointment.Status,
                CancellationReason = appointment.CancellationReason
            };
        }

        private static DoctorScheduleItemDto MapDoctorScheduleItem(Appointment appointment)
        {
            return new DoctorScheduleItemDto
            {
                AppointmentId = appointment.AppointmentId,
                ScheduledDate = appointment.ScheduledDate,
                TimeSlot = (int)appointment.TimeSlot,
                PatientId = appointment.PatientId,
                PatientName = appointment.Patient.FullName,
                Status = (int)appointment.Status,
                CancellationReason = appointment.CancellationReason,
                HasHealthRecord = appointment.HealthRecord != null
            };
        }
    }
}