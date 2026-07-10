using FluentAssertions;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Logging;
using Moq;
using S4_HealthAxis.Shared.DTOs.Doctor;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using S4_HealthAxisApi.Services.Interface;
using System.Text;
using System.Text.Json;
using Xunit;

namespace S4_HealthAxis.Tests.ServiceTests
{
    public class DoctorServiceTests
    {
        private readonly Mock<IDoctorRepository> _doctorRepositoryMock;
        private readonly Mock<IUserService> _userServiceMock;
        private readonly Mock<IDistributedCache> _cacheMock;
        private readonly Mock<ILogger<DoctorService>> _loggerMock;

        private readonly DoctorService _service;

        public DoctorServiceTests()
        {
            _doctorRepositoryMock = new Mock<IDoctorRepository>();
            _userServiceMock = new Mock<IUserService>();
            _cacheMock = new Mock<IDistributedCache>();
            _loggerMock = new Mock<ILogger<DoctorService>>();

            _service = new DoctorService(
                _doctorRepositoryMock.Object,
                _userServiceMock.Object,
                _cacheMock.Object,
                _loggerMock.Object);
        }

        [Fact]
        public async Task GetAllAsync_ShouldReturnMappedDoctors()
        {
            // Arrange
            var doctors = new List<Doctor>
            {
                CreateDoctor(1, "Dr. A", "a@test.com", true),
                CreateDoctor(2, "Dr. B", "b@test.com", false)
            };

            _doctorRepositoryMock
                .Setup(repo => repo.GetAllAsync("name", null))
                .ReturnsAsync(doctors);

            // Act
            var result = (await _service.GetAllAsync("name", null)).ToList();

            // Assert
            result.Should().HaveCount(2);

            result[0].DoctorId.Should().Be(1);
            result[0].FullName.Should().Be("Dr. A");
            result[0].Email.Should().Be("a@test.com");
            result[0].IsActive.Should().BeTrue();

            result[1].DoctorId.Should().Be(2);
            result[1].FullName.Should().Be("Dr. B");
            result[1].Email.Should().Be("b@test.com");
            result[1].IsActive.Should().BeFalse();

            _doctorRepositoryMock.Verify(
                repo => repo.GetAllAsync("name", null),
                Times.Once);
        }

        [Fact]
        public async Task GetActiveBySpecialisationAsync_WithInvalidSpecialisation_ShouldThrowArgumentException()
        {
            // Arrange
            var invalidSpecialisation = 999999;

            // Act
            var action = async () =>
                await _service.GetActiveBySpecialisationAsync(invalidSpecialisation);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid doctor specialisation.");

            _doctorRepositoryMock.Verify(
                repo => repo.GetActiveBySpecialisationAsync(It.IsAny<int>()),
                Times.Never);
        }

        [Fact]
        public async Task GetActiveBySpecialisationAsync_WithValidSpecialisation_ShouldReturnMappedDoctors()
        {
            // Arrange
            var specialisation = ValidSpecialisationId();

            var doctors = new List<Doctor>
            {
                CreateDoctor(1, "Dr. Active", "active@test.com", true)
            };

            _doctorRepositoryMock
                .Setup(repo => repo.GetActiveBySpecialisationAsync(specialisation))
                .ReturnsAsync(doctors);

            // Act
            var result = (await _service.GetActiveBySpecialisationAsync(specialisation)).ToList();

            // Assert
            result.Should().HaveCount(1);
            result[0].DoctorId.Should().Be(1);
            result[0].FullName.Should().Be("Dr. Active");
            result[0].Email.Should().Be("active@test.com");
            result[0].IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repo => repo.GetActiveBySpecialisationAsync(specialisation),
                Times.Once);
        }

        [Fact]
        public async Task GetByIdAsync_WhenDoctorExists_ShouldReturnDoctorDto()
        {
            // Arrange
            var doctor = CreateDoctor(10, "Dr. Existing", "existing@test.com", true);

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(10))
                .ReturnsAsync(doctor);

            // Act
            var result = await _service.GetByIdAsync(10);

            // Assert
            result.Should().NotBeNull();
            result!.DoctorId.Should().Be(10);
            result.FullName.Should().Be("Dr. Existing");
            result.Email.Should().Be("existing@test.com");
        }

        [Fact]
        public async Task GetByIdAsync_WhenDoctorDoesNotExist_ShouldReturnNull()
        {
            // Arrange
            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(99))
                .ReturnsAsync((Doctor?)null);

            // Act
            var result = await _service.GetByIdAsync(99);

            // Assert
            result.Should().BeNull();
        }

        [Fact]
        public async Task CreateAsync_WithValidDoctor_ShouldCreateDoctorAndReturnDto()
        {
            // Arrange
            Doctor? capturedDoctor = null;

            var dto = new CreateDoctorDto
            {
                FullName = "  Dr. New Doctor  ",
                Email = "  NewDoctor@Test.COM  ",
                Specialisation = ValidSpecialisationId(),
                YearsOfExperience = 12,
                ConsultationFee = 800
            };

            _doctorRepositoryMock
                .Setup(repo => repo.AddAsync(It.IsAny<Doctor>()))
                .Callback<Doctor>(doctor =>
                {
                    doctor.DoctorId = 101;
                    capturedDoctor = doctor;
                })
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            // Act
            var result = await _service.CreateAsync(dto);

            // Assert
            capturedDoctor.Should().NotBeNull();
            capturedDoctor!.FullName.Should().Be("Dr. New Doctor");
            capturedDoctor.Email.Should().Be("newdoctor@test.com");
            capturedDoctor.IsActive.Should().BeTrue();
            capturedDoctor.YearsOfExperience.Should().Be(12);
            capturedDoctor.ConsultationFee.Should().Be(800);

            result.DoctorId.Should().Be(101);
            result.FullName.Should().Be("Dr. New Doctor");
            result.Email.Should().Be("newdoctor@test.com");
            result.IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repo => repo.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);
        }

        [Theory]
        [MemberData(nameof(InvalidCreateDoctorDtos))]
        public async Task CreateAsync_WithInvalidDoctor_ShouldThrowArgumentException(
            CreateDoctorDto dto,
            string expectedMessage)
        {
            // Act
            var action = async () => await _service.CreateAsync(dto);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage(expectedMessage);

            _doctorRepositoryMock.Verify(
                repo => repo.AddAsync(It.IsAny<Doctor>()),
                Times.Never);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task UpdateAsync_WithValidDoctor_ShouldUpdateDoctor()
        {
            // Arrange
            var existingDoctor = CreateDoctor(10, "Old Name", "old@test.com", true);

            var dto = new UpdateDoctorDto
            {
                FullName = "  Updated Doctor  ",
                Specialisation = ValidSpecialisationId(),
                YearsOfExperience = 20,
                ConsultationFee = 1200
            };

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(10))
                .ReturnsAsync(existingDoctor);

            _doctorRepositoryMock
                .Setup(repo => repo.UpdateAsync(It.IsAny<Doctor>()))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            // Act
            await _service.UpdateAsync(10, dto);

            // Assert
            existingDoctor.FullName.Should().Be("Updated Doctor");
            existingDoctor.YearsOfExperience.Should().Be(20);
            existingDoctor.ConsultationFee.Should().Be(1200);

            _doctorRepositoryMock.Verify(
                repo => repo.UpdateAsync(existingDoctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task UpdateAsync_WhenDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            var dto = CreateValidUpdateDoctorDto();

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(999))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () => await _service.UpdateAsync(999, dto);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 999 not found.");

            _doctorRepositoryMock.Verify(
                repo => repo.UpdateAsync(It.IsAny<Doctor>()),
                Times.Never);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Never);
        }

        [Theory]
        [MemberData(nameof(InvalidUpdateDoctorDtos))]
        public async Task UpdateAsync_WithInvalidDoctor_ShouldThrowArgumentException(
            UpdateDoctorDto dto,
            string expectedMessage)
        {
            // Act
            var action = async () => await _service.UpdateAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage(expectedMessage);

            _doctorRepositoryMock.Verify(
                repo => repo.GetByIdAsync(It.IsAny<int>()),
                Times.Never);
        }

        [Fact]
        public async Task GetAvailabilityAsync_WhenDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(404))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () =>
                await _service.GetAvailabilityAsync(
                    404,
                    DateOnly.FromDateTime(DateTime.Today.AddDays(1)));

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor not found.");

            _cacheMock.Verify(
                cache => cache.GetAsync(
                    It.IsAny<string>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task GetAvailabilityAsync_WhenCacheHit_ShouldReturnCachedSlotsAndNotCallBookedSlots()
        {
            // Arrange
            var doctorId = 10;
            var date = DateOnly.FromDateTime(DateTime.Today.AddDays(1));
            var cacheKey = BuildAvailabilityCacheKey(doctorId, date);

            var cachedSlots = new List<int> { 1, 2, 3 };
            var cachedBytes = Encoding.UTF8.GetBytes(JsonSerializer.Serialize(cachedSlots));

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(doctorId))
                .ReturnsAsync(CreateDoctor(doctorId, "Dr. Cache", "cache@test.com", true));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync(cachedBytes);

            // Act
            var result = (await _service.GetAvailabilityAsync(doctorId, date)).ToList();

            // Assert
            result.Should().BeEquivalentTo(cachedSlots);

            _doctorRepositoryMock.Verify(
                repo => repo.GetBookedSlotsAsync(It.IsAny<int>(), It.IsAny<DateOnly>()),
                Times.Never);

            _cacheMock.Verify(
                cache => cache.SetAsync(
                    It.IsAny<string>(),
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task GetAvailabilityAsync_WhenCacheMiss_ShouldLoadFromRepositoryAndCacheResult()
        {
            // Arrange
            var doctorId = 10;
            var date = DateOnly.FromDateTime(DateTime.Today.AddDays(1));
            var cacheKey = BuildAvailabilityCacheKey(doctorId, date);

            var bookedSlots = new List<int>
            {
                (int)Enum.GetValues<AppointmentTimeSlot>().First()
            };

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(doctorId))
                .ReturnsAsync(CreateDoctor(doctorId, "Dr. Miss", "miss@test.com", true));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync((byte[]?)null);

            _doctorRepositoryMock
                .Setup(repo => repo.GetBookedSlotsAsync(doctorId, date))
                .ReturnsAsync(bookedSlots);

            byte[]? cachedValue = null;
            DistributedCacheEntryOptions? cacheOptions = null;

            _cacheMock
                .Setup(cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()))
                .Callback<string, byte[], DistributedCacheEntryOptions, CancellationToken>(
                    (_, value, options, _) =>
                    {
                        cachedValue = value;
                        cacheOptions = options;
                    })
                .Returns(Task.CompletedTask);

            var allSlots =
                Enum.GetValues<AppointmentTimeSlot>()
                    .Select(slot => (int)slot)
                    .ToList();

            var expectedSlots =
                allSlots
                    .Except(bookedSlots)
                    .ToList();

            // Act
            var result = (await _service.GetAvailabilityAsync(doctorId, date)).ToList();

            // Assert
            result.Should().BeEquivalentTo(expectedSlots);

            _doctorRepositoryMock.Verify(
                repo => repo.GetBookedSlotsAsync(doctorId, date),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()),
                Times.Once);

            cachedValue.Should().NotBeNull();

            var cachedSlots =
                JsonSerializer.Deserialize<List<int>>(
                    Encoding.UTF8.GetString(cachedValue!));

            cachedSlots.Should().BeEquivalentTo(expectedSlots);

            cacheOptions.Should().NotBeNull();
            cacheOptions!.AbsoluteExpirationRelativeToNow.Should().Be(TimeSpan.FromMinutes(5));
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_WhenEmailExists_ShouldThrowArgumentException()
        {
            // Arrange
            var dto = CreateValidCreateDoctorDto();

            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.CreateDoctorWithAccountAsync(dto);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Email already exists.");

            _doctorRepositoryMock.Verify(
                repo => repo.AddAsync(It.IsAny<Doctor>()),
                Times.Never);

            _userServiceMock.Verify(
                service => service.CreateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_WithValidInput_ShouldCreateDoctorAndUser()
        {
            // Arrange
            var dto = new CreateDoctorDto
            {
                FullName = "  Dr. Account  ",
                Email = "  Account@Test.COM  ",
                Specialisation = ValidSpecialisationId(),
                YearsOfExperience = 8,
                ConsultationFee = 900
            };

            Doctor? capturedDoctor = null;
            User? capturedUser = null;

            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(false);

            _doctorRepositoryMock
                .Setup(repo => repo.AddAsync(It.IsAny<Doctor>()))
                .Callback<Doctor>(doctor =>
                {
                    doctor.DoctorId = 500;
                    capturedDoctor = doctor;
                })
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _userServiceMock
                .Setup(service => service.CreateAsync(It.IsAny<User>()))
                .Callback<User>(user => capturedUser = user)
                .Returns(Task.CompletedTask);

            _userServiceMock
                .Setup(service => service.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            // Act
            var result = await _service.CreateDoctorWithAccountAsync(dto);

            // Assert
            capturedDoctor.Should().NotBeNull();
            capturedDoctor!.DoctorId.Should().Be(500);
            capturedDoctor.FullName.Should().Be("Dr. Account");
            capturedDoctor.Email.Should().Be("account@test.com");
            capturedDoctor.IsActive.Should().BeTrue();

            capturedUser.Should().NotBeNull();
            capturedUser!.Email.Should().Be("account@test.com");
            capturedUser.Role.Should().Be(UserRole.Doctor);
            capturedUser.ReferenceId.Should().Be(500);
            capturedUser.MustChangePassword.Should().BeTrue();
            capturedUser.PasswordHash.Should().NotBeNullOrWhiteSpace();
            capturedUser.PasswordHash.Should().NotBe(result.TemporaryPassword);

            result.DoctorId.Should().Be(500);
            result.FullName.Should().Be("Dr. Account");
            result.Email.Should().Be("account@test.com");
            result.TemporaryPassword.Should().StartWith("Doc@");

            _doctorRepositoryMock.Verify(
                repo => repo.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);

            _userServiceMock.Verify(
                service => service.CreateAsync(It.IsAny<User>()),
                Times.Once);

            _userServiceMock.Verify(
                service => service.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task ActivateAsync_WhenDoctorExists_ShouldActivateDoctor()
        {
            // Arrange
            var doctor = CreateDoctor(20, "Dr. Inactive", "inactive@test.com", false);

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(20))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repo => repo.UpdateAsync(It.IsAny<Doctor>()))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            // Act
            await _service.ActivateAsync(20);

            // Assert
            doctor.IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repo => repo.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task ActivateAsync_WhenDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(123))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () => await _service.ActivateAsync(123);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 123 not found.");

            _doctorRepositoryMock.Verify(
                repo => repo.UpdateAsync(It.IsAny<Doctor>()),
                Times.Never);
        }

        [Fact]
        public async Task DeactivateAsync_WhenDoctorExists_ShouldDeactivateDoctor()
        {
            // Arrange
            var doctor = CreateDoctor(20, "Dr. Active", "active@test.com", true);

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(20))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repo => repo.UpdateAsync(It.IsAny<Doctor>()))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            // Act
            await _service.DeactivateAsync(20);

            // Assert
            doctor.IsActive.Should().BeFalse();

            _doctorRepositoryMock.Verify(
                repo => repo.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task DeactivateAsync_WhenDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(123))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () => await _service.DeactivateAsync(123);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 123 not found.");

            _doctorRepositoryMock.Verify(
                repo => repo.UpdateAsync(It.IsAny<Doctor>()),
                Times.Never);
        }

        public static IEnumerable<object[]> InvalidCreateDoctorDtos()
        {
            yield return new object[]
            {
                new CreateDoctorDto
                {
                    FullName = "",
                    Email = "doctor@test.com",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 10,
                    ConsultationFee = 500
                },
                "Doctor name is required."
            };

            yield return new object[]
            {
                new CreateDoctorDto
                {
                    FullName = "Dr. Test",
                    Email = "",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 10,
                    ConsultationFee = 500
                },
                "Email is required."
            };

            yield return new object[]
            {
                new CreateDoctorDto
                {
                    FullName = "Dr. Test",
                    Email = "doctor@test.com",
                    Specialisation = 999999,
                    YearsOfExperience = 10,
                    ConsultationFee = 500
                },
                "Invalid doctor specialisation."
            };

            yield return new object[]
            {
                new CreateDoctorDto
                {
                    FullName = "Dr. Test",
                    Email = "doctor@test.com",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = -1,
                    ConsultationFee = 500
                },
                "Experience must be between 0 and 60 years."
            };

            yield return new object[]
            {
                new CreateDoctorDto
                {
                    FullName = "Dr. Test",
                    Email = "doctor@test.com",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 61,
                    ConsultationFee = 500
                },
                "Experience must be between 0 and 60 years."
            };

            yield return new object[]
            {
                new CreateDoctorDto
                {
                    FullName = "Dr. Test",
                    Email = "doctor@test.com",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 10,
                    ConsultationFee = 0
                },
                "Consultation fee must be greater than zero."
            };
        }

        public static IEnumerable<object[]> InvalidUpdateDoctorDtos()
        {
            yield return new object[]
            {
                new UpdateDoctorDto
                {
                    FullName = "",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 10,
                    ConsultationFee = 500
                },
                "Doctor name is required."
            };

            yield return new object[]
            {
                new UpdateDoctorDto
                {
                    FullName = "Dr. Test",
                    Specialisation = 999999,
                    YearsOfExperience = 10,
                    ConsultationFee = 500
                },
                "Invalid doctor specialisation."
            };

            yield return new object[]
            {
                new UpdateDoctorDto
                {
                    FullName = "Dr. Test",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = -1,
                    ConsultationFee = 500
                },
                "Experience must be between 0 and 60 years."
            };

            yield return new object[]
            {
                new UpdateDoctorDto
                {
                    FullName = "Dr. Test",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 61,
                    ConsultationFee = 500
                },
                "Experience must be between 0 and 60 years."
            };

            yield return new object[]
            {
                new UpdateDoctorDto
                {
                    FullName = "Dr. Test",
                    Specialisation = ValidSpecialisationId(),
                    YearsOfExperience = 10,
                    ConsultationFee = 0
                },
                "Consultation fee must be greater than zero."
            };
        }

        private static Doctor CreateDoctor(
            int id,
            string fullName,
            string email,
            bool isActive)
        {
            return new Doctor
            {
                DoctorId = id,
                FullName = fullName,
                Email = email,
                Specialisation = ValidSpecialisation(),
                YearsOfExperience = 10,
                ConsultationFee = 500,
                IsActive = isActive
            };
        }

        private static CreateDoctorDto CreateValidCreateDoctorDto()
        {
            return new CreateDoctorDto
            {
                FullName = "Dr. Valid",
                Email = "valid@test.com",
                Specialisation = ValidSpecialisationId(),
                YearsOfExperience = 10,
                ConsultationFee = 500
            };
        }

        private static UpdateDoctorDto CreateValidUpdateDoctorDto()
        {
            return new UpdateDoctorDto
            {
                FullName = "Dr. Valid",
                Specialisation = ValidSpecialisationId(),
                YearsOfExperience = 10,
                ConsultationFee = 500
            };
        }

        private static DoctorSpecialisation ValidSpecialisation()
        {
            return Enum.GetValues<DoctorSpecialisation>().First();
        }

        private static int ValidSpecialisationId()
        {
            return (int)ValidSpecialisation();
        }

        private static string BuildAvailabilityCacheKey(
            int doctorId,
            DateOnly date)
        {
            return $"doctors:{doctorId}:availability:{date:yyyy-MM-dd}";
        }
    }
}
