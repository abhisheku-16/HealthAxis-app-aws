using Microsoft.AspNetCore.Identity;
using S4_HealthAxis.Shared.DTOs.Doctor;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Interface;

namespace S4_HealthAxisApi.Services.Implementation
{
    public class DoctorService : IDoctorService
    {
        private readonly IDoctorRepository _doctorRepository;
        private readonly IUserService _userService;
        private readonly ILogger<DoctorService> _logger;
        private readonly IPasswordHasher<User> _passwordHasher;

        public DoctorService(
            IDoctorRepository doctorRepository,
            IUserService userService,
            ILogger<DoctorService> logger,
            IPasswordHasher<User> passwordHasher)
        {
            _doctorRepository = doctorRepository;
            _userService = userService;
            _logger = logger;
            _passwordHasher = passwordHasher;
        }

        public async Task<IEnumerable<DoctorDto>> GetAllAsync(
            string? sortBy,
            int? specialisation)
        {
            var doctors =
                await _doctorRepository.GetAllAsync(
                    sortBy,
                    specialisation);

            return doctors.Select(MapToDoctorDto);
        }

        public async Task<IEnumerable<DoctorDto>> GetActiveBySpecialisationAsync(
            int specialisation)
        {
            if (!Enum.IsDefined(typeof(DoctorSpecialisation), specialisation))
            {
                throw new ArgumentException("Invalid doctor specialisation.");
            }

            var doctors =
                await _doctorRepository
                    .GetActiveBySpecialisationAsync(
                        specialisation);

            return doctors.Select(MapToDoctorDto);
        }

        public async Task<DoctorDto?> GetByIdAsync(int id)
        {
            var doctor =
                await _doctorRepository.GetByIdAsync(id);

            return doctor == null
                ? null
                : MapToDoctorDto(doctor);
        }

        public async Task<DoctorDto> CreateAsync(CreateDoctorDto dto)
        {
            ValidateDoctor(dto);

            var doctor = new Doctor
            {
                FullName = dto.FullName.Trim(),
                Email = dto.Email.Trim().ToLower(),
                Specialisation = (DoctorSpecialisation)dto.Specialisation,
                YearsOfExperience = dto.YearsOfExperience,
                ConsultationFee = dto.ConsultationFee,
                IsActive = true
            };

            await _doctorRepository.AddAsync(doctor);
            await _doctorRepository.SaveChangesAsync();

            return MapToDoctorDto(doctor);
        }

        public async Task UpdateAsync(
            int id,
            UpdateDoctorDto dto)
        {
            ValidateDoctor(dto);

            var doctor =
                await _doctorRepository.GetByIdAsync(id);

            if (doctor == null)
            {
                throw new KeyNotFoundException(
                    $"Doctor with Id {id} not found.");
            }

            doctor.FullName = dto.FullName.Trim();
            doctor.Specialisation = (DoctorSpecialisation)dto.Specialisation;
            doctor.YearsOfExperience = dto.YearsOfExperience;
            doctor.ConsultationFee = dto.ConsultationFee;

            await _doctorRepository.UpdateAsync(doctor);
            await _doctorRepository.SaveChangesAsync();
        }

        public async Task<IEnumerable<int>> GetAvailabilityAsync(
            int doctorId,
            DateOnly date)
        {
            var doctor =
                await _doctorRepository.GetByIdAsync(doctorId);

            if (doctor == null)
            {
                throw new KeyNotFoundException("Doctor not found.");
            }

            var bookedSlots =
                await _doctorRepository.GetBookedSlotsAsync(
                    doctorId,
                    date);

            var allSlots =
                Enum.GetValues<AppointmentTimeSlot>()
                    .Select(slot => (int)slot);

            var availableSlots =
                allSlots
                    .Except(bookedSlots)
                    .ToList();

            _logger.LogInformation(
                """
                ====================================
                DOCTOR AVAILABILITY CALCULATED
                ====================================

                Doctor Id  : {DoctorId}
                Date       : {Date:yyyy-MM-dd}
                Slot Count : {SlotCount}

                ====================================
                """,
                doctorId,
                date,
                availableSlots.Count);

            return availableSlots;
        }

        public async Task<DoctorCreationResultDto> CreateDoctorWithAccountAsync(
            CreateDoctorDto dto)
        {
            ValidateDoctor(dto);

            if (await _userService.EmailExistsAsync(dto.Email))
            {
                throw new ArgumentException("Email already exists.");
            }

            var doctor = new Doctor
            {
                FullName = dto.FullName.Trim(),
                Email = dto.Email.Trim().ToLower(),
                Specialisation = (DoctorSpecialisation)dto.Specialisation,
                YearsOfExperience = dto.YearsOfExperience,
                ConsultationFee = dto.ConsultationFee,
                IsActive = true
            };

            await _doctorRepository.AddAsync(doctor);
            await _doctorRepository.SaveChangesAsync();

            var temporaryPassword =
                GenerateTemporaryPassword();

            var user = new User
            {
                Email = doctor.Email,
                Role = UserRole.Doctor,
                ReferenceId = doctor.DoctorId,
                CreatedDate = DateTime.UtcNow,
                MustChangePassword = true
            };

            user.PasswordHash =
                _passwordHasher.HashPassword(
                    user,
                    temporaryPassword);

            await _userService.CreateAsync(user);
            await _userService.SaveChangesAsync();

            return new DoctorCreationResultDto
            {
                DoctorId = doctor.DoctorId,
                FullName = doctor.FullName,
                Email = doctor.Email,
                TemporaryPassword = temporaryPassword
            };
        }

        public async Task ActivateAsync(int id)
        {
            var doctor =
                await _doctorRepository.GetByIdAsync(id);

            if (doctor == null)
            {
                throw new KeyNotFoundException(
                    $"Doctor with Id {id} not found.");
            }

            doctor.IsActive = true;

            await _doctorRepository.UpdateAsync(doctor);
            await _doctorRepository.SaveChangesAsync();
        }

        public async Task DeactivateAsync(int id)
        {
            var doctor =
                await _doctorRepository.GetByIdAsync(id);

            if (doctor == null)
            {
                throw new KeyNotFoundException(
                    $"Doctor with Id {id} not found.");
            }

            doctor.IsActive = false;

            await _doctorRepository.UpdateAsync(doctor);
            await _doctorRepository.SaveChangesAsync();
        }

        private static void ValidateDoctor(CreateDoctorDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.FullName))
            {
                throw new ArgumentException("Doctor name is required.");
            }

            if (string.IsNullOrWhiteSpace(dto.Email))
            {
                throw new ArgumentException("Email is required.");
            }

            if (!Enum.IsDefined(typeof(DoctorSpecialisation), dto.Specialisation))
            {
                throw new ArgumentException("Invalid doctor specialisation.");
            }

            if (dto.YearsOfExperience < 0 ||
                dto.YearsOfExperience > 60)
            {
                throw new ArgumentException(
                    "Experience must be between 0 and 60 years.");
            }

            if (dto.ConsultationFee <= 0)
            {
                throw new ArgumentException(
                    "Consultation fee must be greater than zero.");
            }
        }

        private static void ValidateDoctor(UpdateDoctorDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.FullName))
            {
                throw new ArgumentException("Doctor name is required.");
            }

            if (!Enum.IsDefined(typeof(DoctorSpecialisation), dto.Specialisation))
            {
                throw new ArgumentException("Invalid doctor specialisation.");
            }

            if (dto.YearsOfExperience < 0 ||
                dto.YearsOfExperience > 60)
            {
                throw new ArgumentException(
                    "Experience must be between 0 and 60 years.");
            }

            if (dto.ConsultationFee <= 0)
            {
                throw new ArgumentException(
                    "Consultation fee must be greater than zero.");
            }
        }

        private static string GenerateTemporaryPassword()
        {
            return $"Doc@{Random.Shared.Next(100000, 999999)}";
        }

        private static DoctorDto MapToDoctorDto(Doctor doctor)
        {
            return new DoctorDto
            {
                DoctorId = doctor.DoctorId,
                FullName = doctor.FullName,
                Email = doctor.Email,
                Specialisation = (int)doctor.Specialisation,
                YearsOfExperience = doctor.YearsOfExperience,
                ConsultationFee = doctor.ConsultationFee,
                IsActive = doctor.IsActive
            };
        }
    }
}
