using System.Text;
using System.Text.Json;
using FluentAssertions;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Logging;
using Moq;
using S4_HealthAxis.Shared.DTOs.Doctor;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using S4_HealthAxisApi.Services.Interface;
using Xunit;

namespace S4_HealthAxis.Tests.ServiceTests
{
    public class DoctorServiceTests
    {
        private readonly Mock<IDoctorRepository> _doctorRepositoryMock;
        private readonly Mock<IUserService> _userServiceMock;
        private readonly Mock<IDistributedCache> _cacheMock;
        private readonly Mock<ILogger<DoctorService>> _loggerMock;
        private readonly Mock<IPasswordHasher<User>> _passwordHasherMock;

        private readonly DoctorService _service;

        public DoctorServiceTests()
        {
            _doctorRepositoryMock = new Mock<IDoctorRepository>(MockBehavior.Strict);
            _userServiceMock = new Mock<IUserService>(MockBehavior.Strict);
            _cacheMock = new Mock<IDistributedCache>(MockBehavior.Strict);
            _loggerMock = new Mock<ILogger<DoctorService>>();
            _passwordHasherMock = new Mock<IPasswordHasher<User>>(MockBehavior.Strict);

            _service = new DoctorService(
                _doctorRepositoryMock.Object,
                _userServiceMock.Object,
                _cacheMock.Object,
                _loggerMock.Object,
                _passwordHasherMock.Object);
        }

        #region GetAllAsync

        [Fact]
        public async Task GetAllAsync_ShouldReturnMappedDoctors_WhenDoctorsExist()
        {
            var doctors = new List<Doctor>
            {
                BuildDoctor(1, "Arun Nair", "arun@healthaxis.com", DoctorSpecialisation.GeneralPractitioner, true),
                BuildDoctor(2, "Rohan Menon", "rohan@healthaxis.com", DoctorSpecialisation.Cardiologist, false)
            };

            _doctorRepositoryMock
                .Setup(repository => repository.GetAllAsync("name", 1))
                .ReturnsAsync(doctors);

            var result = (await _service.GetAllAsync("name", 1)).ToList();

            result.Should().HaveCount(2);

            result[0].DoctorId.Should().Be(1);
            result[0].FullName.Should().Be("Arun Nair");
            result[0].Email.Should().Be("arun@healthaxis.com");
            result[0].Specialisation.Should().Be((int)DoctorSpecialisation.GeneralPractitioner);
            result[0].IsActive.Should().BeTrue();

            result[1].DoctorId.Should().Be(2);
            result[1].FullName.Should().Be("Rohan Menon");
            result[1].Email.Should().Be("rohan@healthaxis.com");
            result[1].Specialisation.Should().Be((int)DoctorSpecialisation.Cardiologist);
            result[1].IsActive.Should().BeFalse();

            _doctorRepositoryMock.Verify(
                repository => repository.GetAllAsync("name", 1),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAllAsync_ShouldReturnEmptyCollection_WhenNoDoctorsExist()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetAllAsync(null, null))
                .ReturnsAsync(new List<Doctor>());

            var result = (await _service.GetAllAsync(null, null)).ToList();

            result.Should().BeEmpty();

            _doctorRepositoryMock.Verify(
                repository => repository.GetAllAsync(null, null),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(null, null)]
        [InlineData("name", null)]
        [InlineData("fee", 1)]
        [InlineData("experience", 2)]
        public async Task GetAllAsync_ShouldForwardSortAndSpecialisationArguments(
            string? sortBy,
            int? specialisation)
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetAllAsync(sortBy, specialisation))
                .ReturnsAsync(new List<Doctor>());

            await _service.GetAllAsync(sortBy, specialisation);

            _doctorRepositoryMock.Verify(
                repository => repository.GetAllAsync(sortBy, specialisation),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAllAsync_ShouldPropagateException_WhenRepositoryThrows()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetAllAsync(null, null))
                .ThrowsAsync(new InvalidOperationException("Doctor list failed."));

            var act = async () => await _service.GetAllAsync(null, null);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor list failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetAllAsync(null, null),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region GetActiveBySpecialisationAsync

        [Fact]
        public async Task GetActiveBySpecialisationAsync_ShouldReturnMappedDoctors_WhenSpecialisationIsValid()
        {
            var doctors = new List<Doctor>
            {
                BuildDoctor(1, "Doctor One", "one@healthaxis.com", DoctorSpecialisation.Cardiologist, true),
                BuildDoctor(2, "Doctor Two", "two@healthaxis.com", DoctorSpecialisation.Cardiologist, true)
            };

            _doctorRepositoryMock
                .Setup(repository => repository.GetActiveBySpecialisationAsync((int)DoctorSpecialisation.Cardiologist))
                .ReturnsAsync(doctors);

            var result = (await _service.GetActiveBySpecialisationAsync((int)DoctorSpecialisation.Cardiologist)).ToList();

            result.Should().HaveCount(2);
            result.Should().OnlyContain(doctor => doctor.Specialisation == (int)DoctorSpecialisation.Cardiologist);

            _doctorRepositoryMock.Verify(
                repository => repository.GetActiveBySpecialisationAsync((int)DoctorSpecialisation.Cardiologist),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        [InlineData(999)]
        public async Task GetActiveBySpecialisationAsync_ShouldThrowArgumentException_WhenSpecialisationIsInvalid(
            int specialisation)
        {
            var act = async () => await _service.GetActiveBySpecialisationAsync(specialisation);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid doctor specialisation.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetActiveBySpecialisationAsync(It.IsAny<int>()),
                Times.Never);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetActiveBySpecialisationAsync_ShouldPropagateException_WhenRepositoryThrows()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetActiveBySpecialisationAsync((int)DoctorSpecialisation.Cardiologist))
                .ThrowsAsync(new InvalidOperationException("Specialisation lookup failed."));

            var act = async () => await _service.GetActiveBySpecialisationAsync((int)DoctorSpecialisation.Cardiologist);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Specialisation lookup failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetActiveBySpecialisationAsync((int)DoctorSpecialisation.Cardiologist),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region GetByIdAsync

        [Fact]
        public async Task GetByIdAsync_ShouldReturnNull_WhenDoctorDoesNotExist()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync((Doctor?)null);

            var result = await _service.GetByIdAsync(1);

            result.Should().BeNull();

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(1),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetByIdAsync_ShouldReturnMappedDoctor_WhenDoctorExists()
        {
            var doctor = BuildDoctor(
                1,
                "Arun Nair",
                "arun@healthaxis.com",
                DoctorSpecialisation.GeneralPractitioner,
                true);

            doctor.YearsOfExperience = 8;
            doctor.ConsultationFee = 500;

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(doctor);

            var result = await _service.GetByIdAsync(1);

            result.Should().NotBeNull();
            result!.DoctorId.Should().Be(1);
            result.FullName.Should().Be("Arun Nair");
            result.Email.Should().Be("arun@healthaxis.com");
            result.Specialisation.Should().Be((int)DoctorSpecialisation.GeneralPractitioner);
            result.YearsOfExperience.Should().Be(8);
            result.ConsultationFee.Should().Be(500);
            result.IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(1),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetByIdAsync_ShouldPropagateException_WhenRepositoryThrows()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ThrowsAsync(new InvalidOperationException("Doctor lookup failed."));

            var act = async () => await _service.GetByIdAsync(1);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor lookup failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(1),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region CreateAsync

        [Fact]
        public async Task CreateAsync_ShouldCreateDoctor_WhenRequestIsValid()
        {
            var dto = BuildValidCreateDoctorDto();
            dto.FullName = "  New Doctor  ";
            dto.Email = "  New.Doctor@HealthAxis.COM  ";

            Doctor? capturedDoctor = null;

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .Callback<Doctor>(doctor =>
                {
                    capturedDoctor = doctor;
                    doctor.DoctorId = 55;
                })
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.CreateAsync(dto);

            capturedDoctor.Should().NotBeNull();
            capturedDoctor!.DoctorId.Should().Be(55);
            capturedDoctor.FullName.Should().Be("New Doctor");
            capturedDoctor.Email.Should().Be("new.doctor@healthaxis.com");
            capturedDoctor.Specialisation.Should().Be(DoctorSpecialisation.Cardiologist);
            capturedDoctor.YearsOfExperience.Should().Be(dto.YearsOfExperience);
            capturedDoctor.ConsultationFee.Should().Be(dto.ConsultationFee);
            capturedDoctor.IsActive.Should().BeTrue();

            result.DoctorId.Should().Be(55);
            result.FullName.Should().Be("New Doctor");
            result.Email.Should().Be("new.doctor@healthaxis.com");
            result.Specialisation.Should().Be(dto.Specialisation);
            result.IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenNameIsMissing(string fullName)
        {
            var dto = BuildValidCreateDoctorDto();
            dto.FullName = fullName;

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Doctor name is required.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenEmailIsMissing(string email)
        {
            var dto = BuildValidCreateDoctorDto();
            dto.Email = email;

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Email is required.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        [InlineData(999)]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenSpecialisationIsInvalid(int specialisation)
        {
            var dto = BuildValidCreateDoctorDto();
            dto.Specialisation = specialisation;

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid doctor specialisation.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(-1)]
        [InlineData(61)]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenExperienceIsInvalid(int experience)
        {
            var dto = BuildValidCreateDoctorDto();
            dto.YearsOfExperience = experience;

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Experience must be between 0 and 60 years.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenConsultationFeeIsInvalid(decimal fee)
        {
            var dto = BuildValidCreateDoctorDto();
            dto.ConsultationFee = fee;

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Consultation fee must be greater than zero.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(60)]
        public async Task CreateAsync_ShouldAllowBoundaryExperienceValues(int experience)
        {
            var dto = BuildValidCreateDoctorDto();
            dto.YearsOfExperience = experience;

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.CreateAsync(dto);

            result.YearsOfExperience.Should().Be(experience);

            _doctorRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_ShouldNotSave_WhenAddFails()
        {
            var dto = BuildValidCreateDoctorDto();

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .ThrowsAsync(new InvalidOperationException("Add doctor failed."));

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Add doctor failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_ShouldPropagateException_WhenSaveFails()
        {
            var dto = BuildValidCreateDoctorDto();

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Save doctor failed."));

            var act = async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Save doctor failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region UpdateAsync

        [Fact]
        public async Task UpdateAsync_ShouldUpdateDoctor_WhenRequestIsValid()
        {
            var doctor = BuildDoctor(
                10,
                "Old Doctor",
                "old@healthaxis.com",
                DoctorSpecialisation.GeneralPractitioner,
                false);

            var dto = new UpdateDoctorDto
            {
                FullName = "  Updated Doctor  ",
                Specialisation = (int)DoctorSpecialisation.Cardiologist,
                YearsOfExperience = 12,
                ConsultationFee = 900
            };

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(10))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            await _service.UpdateAsync(10, dto);

            doctor.FullName.Should().Be("Updated Doctor");
            doctor.Specialisation.Should().Be(DoctorSpecialisation.Cardiologist);
            doctor.YearsOfExperience.Should().Be(12);
            doctor.ConsultationFee.Should().Be(900);
            doctor.Email.Should().Be("old@healthaxis.com");
            doctor.IsActive.Should().BeFalse();

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(10),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_ShouldThrowKeyNotFoundException_WhenDoctorDoesNotExist()
        {
            var dto = BuildValidUpdateDoctorDto();

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(404))
                .ReturnsAsync((Doctor?)null);

            var act = async () => await _service.UpdateAsync(404, dto);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 404 not found.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(404),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<Doctor>()),
                Times.Never);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task UpdateAsync_ShouldThrowArgumentException_WhenNameIsMissing(string fullName)
        {
            var dto = BuildValidUpdateDoctorDto();
            dto.FullName = fullName;

            var act = async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Doctor name is required.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        [InlineData(999)]
        public async Task UpdateAsync_ShouldThrowArgumentException_WhenSpecialisationIsInvalid(int specialisation)
        {
            var dto = BuildValidUpdateDoctorDto();
            dto.Specialisation = specialisation;

            var act = async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid doctor specialisation.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(-1)]
        [InlineData(61)]
        public async Task UpdateAsync_ShouldThrowArgumentException_WhenExperienceIsInvalid(int experience)
        {
            var dto = BuildValidUpdateDoctorDto();
            dto.YearsOfExperience = experience;

            var act = async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Experience must be between 0 and 60 years.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(-1)]
        public async Task UpdateAsync_ShouldThrowArgumentException_WhenConsultationFeeIsInvalid(decimal fee)
        {
            var dto = BuildValidUpdateDoctorDto();
            dto.ConsultationFee = fee;

            var act = async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Consultation fee must be greater than zero.");

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_ShouldNotSave_WhenUpdateFails()
        {
            var doctor = BuildDoctor(
                10,
                "Old Doctor",
                "old@healthaxis.com",
                DoctorSpecialisation.GeneralPractitioner,
                true);

            var dto = BuildValidUpdateDoctorDto();

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(10))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .ThrowsAsync(new InvalidOperationException("Update doctor failed."));

            var act = async () => await _service.UpdateAsync(10, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Update doctor failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(10),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_ShouldPropagateException_WhenSaveFails()
        {
            var doctor = BuildDoctor(
                10,
                "Old Doctor",
                "old@healthaxis.com",
                DoctorSpecialisation.GeneralPractitioner,
                true);

            var dto = BuildValidUpdateDoctorDto();

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(10))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Save update failed."));

            var act = async () => await _service.UpdateAsync(10, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Save update failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(10),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region GetAvailabilityAsync

        [Fact]
        public async Task GetAvailabilityAsync_ShouldThrowKeyNotFoundException_WhenDoctorDoesNotExist()
        {
            var date = new DateOnly(2026, 7, 15);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync((Doctor?)null);

            var act = async () => await _service.GetAvailabilityAsync(1, date);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor not found.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(1),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.GetAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()),
                Times.Never);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAvailabilityAsync_ShouldReturnCachedSlots_WhenCacheHitExists()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);
            var cachedSlots = new List<int> { 1, 2, 3 };

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync(ToBytes(JsonSerializer.Serialize(cachedSlots)));

            var result = (await _service.GetAvailabilityAsync(3, date)).ToList();

            result.Should().Equal(cachedSlots);

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(3),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.GetBookedSlotsAsync(It.IsAny<int>(), It.IsAny<DateOnly>()),
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
        public async Task GetAvailabilityAsync_ShouldTreatWhitespaceCacheValueAsCacheMiss()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync(ToBytes("   "));

            _doctorRepositoryMock
                .Setup(repository => repository.GetBookedSlotsAsync(3, date))
                .ReturnsAsync(new List<int>());

            _cacheMock
                .Setup(cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.Is<DistributedCacheEntryOptions>(options =>
                        options.AbsoluteExpirationRelativeToNow == TimeSpan.FromMinutes(5)),
                    It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask);

            var result = (await _service.GetAvailabilityAsync(3, date)).ToList();

            result.Should().Equal(GetAllAppointmentSlotValues());

            _doctorRepositoryMock.Verify(
                repository => repository.GetBookedSlotsAsync(3, date),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()),
                Times.Once);
        }

        [Fact]
        public async Task GetAvailabilityAsync_ShouldReturnAvailableSlotsAndCacheThem_WhenCacheMiss()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);

            var bookedSlots = new List<int>
            {
                (int)AppointmentTimeSlot.TenAM,
                (int)AppointmentTimeSlot.ElevenAM
            };

            var expectedAvailableSlots =
                GetAllAppointmentSlotValues()
                    .Except(bookedSlots)
                    .ToList();

            byte[]? cachedBytes = null;

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync((byte[]?)null);

            _doctorRepositoryMock
                .Setup(repository => repository.GetBookedSlotsAsync(3, date))
                .ReturnsAsync(bookedSlots);

            _cacheMock
                .Setup(cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.Is<DistributedCacheEntryOptions>(options =>
                        options.AbsoluteExpirationRelativeToNow == TimeSpan.FromMinutes(5)),
                    It.IsAny<CancellationToken>()))
                .Callback<string, byte[], DistributedCacheEntryOptions, CancellationToken>(
                    (_, value, _, _) => cachedBytes = value)
                .Returns(Task.CompletedTask);

            var result = (await _service.GetAvailabilityAsync(3, date)).ToList();

            result.Should().Equal(expectedAvailableSlots);

            cachedBytes.Should().NotBeNull();

            var cachedJson = Encoding.UTF8.GetString(cachedBytes!);
            var cachedSlots = JsonSerializer.Deserialize<List<int>>(cachedJson);

            cachedSlots.Should().Equal(expectedAvailableSlots);

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(3),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.GetBookedSlotsAsync(3, date),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()),
                Times.Once);
        }

        [Fact]
        public async Task GetAvailabilityAsync_ShouldReturnEmptyList_WhenAllSlotsAreBooked()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);

            var allSlots = GetAllAppointmentSlotValues();

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync((byte[]?)null);

            _doctorRepositoryMock
                .Setup(repository => repository.GetBookedSlotsAsync(3, date))
                .ReturnsAsync(allSlots);

            _cacheMock
                .Setup(cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask);

            var result = (await _service.GetAvailabilityAsync(3, date)).ToList();

            result.Should().BeEmpty();
        }

        [Fact]
        public async Task GetAvailabilityAsync_ShouldPropagateException_WhenCacheGetFails()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ThrowsAsync(new InvalidOperationException("Cache get failed."));

            var act = async () => await _service.GetAvailabilityAsync(3, date);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Cache get failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetBookedSlotsAsync(It.IsAny<int>(), It.IsAny<DateOnly>()),
                Times.Never);
        }

        [Fact]
        public async Task GetAvailabilityAsync_ShouldPropagateException_WhenBookedSlotsLookupFails()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync((byte[]?)null);

            _doctorRepositoryMock
                .Setup(repository => repository.GetBookedSlotsAsync(3, date))
                .ThrowsAsync(new InvalidOperationException("Booked slots lookup failed."));

            var act = async () => await _service.GetAvailabilityAsync(3, date);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Booked slots lookup failed.");

            _cacheMock.Verify(
                cache => cache.SetAsync(
                    It.IsAny<string>(),
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task GetAvailabilityAsync_ShouldPropagateException_WhenCacheSetFails()
        {
            var date = new DateOnly(2026, 7, 15);
            var cacheKey = BuildExpectedCacheKey(3, date);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(3))
                .ReturnsAsync(BuildDoctor(3));

            _cacheMock
                .Setup(cache => cache.GetAsync(cacheKey, It.IsAny<CancellationToken>()))
                .ReturnsAsync((byte[]?)null);

            _doctorRepositoryMock
                .Setup(repository => repository.GetBookedSlotsAsync(3, date))
                .ReturnsAsync(new List<int>());

            _cacheMock
                .Setup(cache => cache.SetAsync(
                    cacheKey,
                    It.IsAny<byte[]>(),
                    It.IsAny<DistributedCacheEntryOptions>(),
                    It.IsAny<CancellationToken>()))
                .ThrowsAsync(new InvalidOperationException("Cache set failed."));

            var act = async () => await _service.GetAvailabilityAsync(3, date);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Cache set failed.");
        }

        #endregion

        #region CreateDoctorWithAccountAsync

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldThrowArgumentException_WhenEmailAlreadyExists()
        {
            var dto = BuildValidCreateDoctorDto();

            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(true);

            var act = async () => await _service.CreateDoctorWithAccountAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Email already exists.");

            _userServiceMock.Verify(
                service => service.EmailExistsAsync(dto.Email),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Doctor>()),
                Times.Never);

            _userServiceMock.Verify(
                service => service.CreateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldCreateDoctorAndUserAccount_WhenValid()
        {
            var dto = BuildValidCreateDoctorDto();
            dto.FullName = "  Account Doctor  ";
            dto.Email = "  Account.Doctor@HealthAxis.COM  ";

            Doctor? capturedDoctor = null;
            User? capturedUser = null;
            string? capturedTemporaryPassword = null;

            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(false);

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .Callback<Doctor>(doctor =>
                {
                    capturedDoctor = doctor;
                    doctor.DoctorId = 99;
                })
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), It.IsAny<string>()))
                .Callback<User, string>((_, password) => capturedTemporaryPassword = password)
                .Returns("hashed-password");

            _userServiceMock
                .Setup(service => service.CreateAsync(It.IsAny<User>()))
                .Callback<User>(user => capturedUser = user)
                .Returns(Task.CompletedTask);

            _userServiceMock
                .Setup(service => service.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.CreateDoctorWithAccountAsync(dto);

            capturedDoctor.Should().NotBeNull();
            capturedDoctor!.DoctorId.Should().Be(99);
            capturedDoctor.FullName.Should().Be("Account Doctor");
            capturedDoctor.Email.Should().Be("account.doctor@healthaxis.com");
            capturedDoctor.IsActive.Should().BeTrue();

            capturedUser.Should().NotBeNull();
            capturedUser!.Email.Should().Be("account.doctor@healthaxis.com");
            capturedUser.Role.Should().Be(UserRole.Doctor);
            capturedUser.ReferenceId.Should().Be(99);
            capturedUser.MustChangePassword.Should().BeTrue();
            capturedUser.PasswordHash.Should().Be("hashed-password");
            capturedUser.CreatedDate.Should().BeCloseTo(DateTime.UtcNow, TimeSpan.FromSeconds(10));

            capturedTemporaryPassword.Should().NotBeNull();
            capturedTemporaryPassword.Should().StartWith("Doc@");
            capturedTemporaryPassword!.Length.Should().Be(10);

            result.DoctorId.Should().Be(99);
            result.FullName.Should().Be("Account Doctor");
            result.Email.Should().Be("account.doctor@healthaxis.com");
            result.TemporaryPassword.Should().Be(capturedTemporaryPassword);

            _userServiceMock.Verify(
                service => service.EmailExistsAsync(dto.Email),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Doctor>()),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _passwordHasherMock.Verify(
                hasher => hasher.HashPassword(It.IsAny<User>(), It.IsAny<string>()),
                Times.Once);

            _userServiceMock.Verify(
                service => service.CreateAsync(It.IsAny<User>()),
                Times.Once);

            _userServiceMock.Verify(
                service => service.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldNotCheckEmail_WhenValidationFails()
        {
            var dto = BuildValidCreateDoctorDto();
            dto.FullName = "";

            var act = async () => await _service.CreateDoctorWithAccountAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Doctor name is required.");

            _userServiceMock.Verify(
                service => service.EmailExistsAsync(It.IsAny<string>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldNotCreateUser_WhenDoctorAddFails()
        {
            var dto = BuildValidCreateDoctorDto();

            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(false);

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .ThrowsAsync(new InvalidOperationException("Doctor add failed."));

            var act = async () => await _service.CreateDoctorWithAccountAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor add failed.");

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _userServiceMock.Verify(
                service => service.CreateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldNotCreateUser_WhenDoctorSaveFails()
        {
            var dto = BuildValidCreateDoctorDto();

            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(false);

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Doctor save failed."));

            var act = async () => await _service.CreateDoctorWithAccountAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor save failed.");

            _userServiceMock.Verify(
                service => service.CreateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldPropagateException_WhenUserCreateFails()
        {
            var dto = BuildValidCreateDoctorDto();

            SetupSuccessfulDoctorAccountPreUserCreation(dto);

            _userServiceMock
                .Setup(service => service.CreateAsync(It.IsAny<User>()))
                .ThrowsAsync(new InvalidOperationException("User create failed."));

            var act = async () => await _service.CreateDoctorWithAccountAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("User create failed.");

            _userServiceMock.Verify(
                service => service.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task CreateDoctorWithAccountAsync_ShouldPropagateException_WhenUserSaveFails()
        {
            var dto = BuildValidCreateDoctorDto();

            SetupSuccessfulDoctorAccountPreUserCreation(dto);

            _userServiceMock
                .Setup(service => service.CreateAsync(It.IsAny<User>()))
                .Returns(Task.CompletedTask);

            _userServiceMock
                .Setup(service => service.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("User save failed."));

            var act = async () => await _service.CreateDoctorWithAccountAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("User save failed.");
        }

        #endregion

        #region ActivateAsync And DeactivateAsync

        [Fact]
        public async Task ActivateAsync_ShouldActivateDoctor_WhenDoctorExists()
        {
            var doctor = BuildDoctor(4, isActive: false);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(4))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            await _service.ActivateAsync(4);

            doctor.IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(4),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task ActivateAsync_ShouldThrowKeyNotFoundException_WhenDoctorDoesNotExist()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(404))
                .ReturnsAsync((Doctor?)null);

            var act = async () => await _service.ActivateAsync(404);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 404 not found.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(404),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task ActivateAsync_ShouldNotSave_WhenUpdateFails()
        {
            var doctor = BuildDoctor(4, isActive: false);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(4))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .ThrowsAsync(new InvalidOperationException("Activate update failed."));

            var act = async () => await _service.ActivateAsync(4);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Activate update failed.");

            doctor.IsActive.Should().BeTrue();

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task DeactivateAsync_ShouldDeactivateDoctor_WhenDoctorExists()
        {
            var doctor = BuildDoctor(5, isActive: true);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(5))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            await _service.DeactivateAsync(5);

            doctor.IsActive.Should().BeFalse();

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(5),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.UpdateAsync(doctor),
                Times.Once);

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task DeactivateAsync_ShouldThrowKeyNotFoundException_WhenDoctorDoesNotExist()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(404))
                .ReturnsAsync((Doctor?)null);

            var act = async () => await _service.DeactivateAsync(404);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 404 not found.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(404),
                Times.Once);

            _doctorRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task DeactivateAsync_ShouldNotSave_WhenUpdateFails()
        {
            var doctor = BuildDoctor(5, isActive: true);

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(5))
                .ReturnsAsync(doctor);

            _doctorRepositoryMock
                .Setup(repository => repository.UpdateAsync(doctor))
                .ThrowsAsync(new InvalidOperationException("Deactivate update failed."));

            var act = async () => await _service.DeactivateAsync(5);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Deactivate update failed.");

            doctor.IsActive.Should().BeFalse();

            _doctorRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        #endregion

        #region Helpers

        private static Doctor BuildDoctor(
            int id,
            bool isActive = true)
        {
            return BuildDoctor(
                id,
                $"Doctor {id}",
                $"doctor{id}@healthaxis.com",
                DoctorSpecialisation.Cardiologist,
                isActive);
        }

        private static Doctor BuildDoctor(
            int id,
            string fullName,
            string email,
            DoctorSpecialisation specialisation,
            bool isActive)
        {
            return new Doctor
            {
                DoctorId = id,
                FullName = fullName,
                Email = email,
                Specialisation = specialisation,
                YearsOfExperience = 10,
                ConsultationFee = 500,
                IsActive = isActive
            };
        }

        private static CreateDoctorDto BuildValidCreateDoctorDto()
        {
            return new CreateDoctorDto
            {
                FullName = "Valid Doctor",
                Email = "valid.doctor@healthaxis.com",
                Specialisation = (int)DoctorSpecialisation.Cardiologist,
                YearsOfExperience = 10,
                ConsultationFee = 500
            };
        }

        private static UpdateDoctorDto BuildValidUpdateDoctorDto()
        {
            return new UpdateDoctorDto
            {
                FullName = "Updated Doctor",
                Specialisation = (int)DoctorSpecialisation.Cardiologist,
                YearsOfExperience = 15,
                ConsultationFee = 800
            };
        }

        private static string BuildExpectedCacheKey(
            int doctorId,
            DateOnly date)
        {
            return $"doctors:{doctorId}:availability:{date:yyyy-MM-dd}";
        }

        private static byte[] ToBytes(string value)
        {
            return Encoding.UTF8.GetBytes(value);
        }

        private static List<int> GetAllAppointmentSlotValues()
        {
            return Enum.GetValues<AppointmentTimeSlot>()
                .Select(slot => (int)slot)
                .ToList();
        }

        private void SetupSuccessfulDoctorAccountPreUserCreation(
            CreateDoctorDto dto)
        {
            _userServiceMock
                .Setup(service => service.EmailExistsAsync(dto.Email))
                .ReturnsAsync(false);

            _doctorRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Doctor>()))
                .Callback<Doctor>(doctor => doctor.DoctorId = 77)
                .Returns(Task.CompletedTask);

            _doctorRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), It.IsAny<string>()))
                .Returns("hashed-password");
        }

        #endregion
    }
}
