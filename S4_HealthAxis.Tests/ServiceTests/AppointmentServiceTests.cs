using FluentAssertions;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Logging;
using Moq;
using S4_HealthAxis.Shared.DTOs.Appointment;
using S4_HealthAxis.Shared.DTOs.Doctor;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Events;
using S4_HealthAxisApi.Messaging;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using Xunit;

namespace S4_HealthAxis.Tests.ServiceTests
{
    public class AppointmentServiceTests
    {
        private readonly Mock<IAppointmentRepository> _appointmentRepositoryMock;
        private readonly Mock<IPatientRepository> _patientRepositoryMock;
        private readonly Mock<IDoctorRepository> _doctorRepositoryMock;
        private readonly Mock<IRabbitMqPublisher> _rabbitMqPublisherMock;
        private readonly Mock<ILogger<AppointmentService>> _loggerMock;
        private readonly Mock<IDistributedCache> _cacheMock;

        private readonly AppointmentService _service;

        public AppointmentServiceTests()
        {
            _appointmentRepositoryMock = new Mock<IAppointmentRepository>();
            _patientRepositoryMock = new Mock<IPatientRepository>();
            _doctorRepositoryMock = new Mock<IDoctorRepository>();
            _rabbitMqPublisherMock = new Mock<IRabbitMqPublisher>();
            _loggerMock = new Mock<ILogger<AppointmentService>>();
            _cacheMock = new Mock<IDistributedCache>();

            _service = new AppointmentService(
                _appointmentRepositoryMock.Object,
                _patientRepositoryMock.Object,
                _doctorRepositoryMock.Object,
                _rabbitMqPublisherMock.Object,
                _loggerMock.Object,
                _cacheMock.Object);
        }

        [Fact]
        public async Task GetAllAsync_ShouldReturnMappedAppointmentDetails()
        {
            // Arrange
            var appointments = new List<Appointment>
            {
                CreateAppointment(
                    appointmentId: 1,
                    patientId: 10,
                    doctorId: 20,
                    date: Tomorrow(),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Pending,
                    patientName: "Patient One",
                    doctorName: "Doctor One"),

                CreateAppointment(
                    appointmentId: 2,
                    patientId: 11,
                    doctorId: 21,
                    date: Tomorrow().AddDays(1),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Confirmed,
                    patientName: "Patient Two",
                    doctorName: "Doctor Two",
                    cancellationReason: "Not applicable")
            };

            _appointmentRepositoryMock
                .Setup(repo => repo.GetAllAsync())
                .ReturnsAsync(appointments);

            // Act
            var result = (await _service.GetAllAsync()).ToList();

            // Assert
            result.Should().HaveCount(2);

            result[0].AppointmentId.Should().Be(1);
            result[0].PatientId.Should().Be(10);
            result[0].PatientName.Should().Be("Patient One");
            result[0].DoctorId.Should().Be(20);
            result[0].DoctorName.Should().Be("Doctor One");
            result[0].Status.Should().Be((int)AppointmentStatus.Pending);

            result[1].AppointmentId.Should().Be(2);
            result[1].PatientName.Should().Be("Patient Two");
            result[1].DoctorName.Should().Be("Doctor Two");
            result[1].Status.Should().Be((int)AppointmentStatus.Confirmed);
            result[1].CancellationReason.Should().Be("Not applicable");

            _appointmentRepositoryMock.Verify(
                repo => repo.GetAllAsync(),
                Times.Once);
        }

        [Fact]
        public async Task GetByIdAsync_WhenAppointmentExists_ShouldReturnMappedAppointmentDetails()
        {
            // Arrange
            var appointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Pending,
                patientName: "Patient One",
                doctorName: "Doctor One");

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            // Act
            var result = await _service.GetByIdAsync(1);

            // Assert
            result.Should().NotBeNull();
            result!.AppointmentId.Should().Be(1);
            result.PatientId.Should().Be(10);
            result.PatientName.Should().Be("Patient One");
            result.DoctorId.Should().Be(20);
            result.DoctorName.Should().Be("Doctor One");
            result.Status.Should().Be((int)AppointmentStatus.Pending);
        }

        [Fact]
        public async Task GetByIdAsync_WhenAppointmentDoesNotExist_ShouldReturnNull()
        {
            // Arrange
            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(999))
                .ReturnsAsync((Appointment?)null);

            // Act
            var result = await _service.GetByIdAsync(999);

            // Assert
            result.Should().BeNull();
        }

        [Fact]
        public async Task GetPatientHistoryAsync_ShouldReturnMappedPatientAppointmentHistory()
        {
            // Arrange
            var patientId = 10;

            var appointments = new List<Appointment>
            {
                CreateAppointment(
                    appointmentId: 1,
                    patientId: patientId,
                    doctorId: 20,
                    date: Tomorrow(),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Pending,
                    patientName: "Patient One",
                    doctorName: "Doctor One")
            };

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByPatientIdAsync(patientId))
                .ReturnsAsync(appointments);

            // Act
            var result = (await _service.GetPatientHistoryAsync(patientId)).ToList();

            // Assert
            result.Should().HaveCount(1);
            result[0].AppointmentId.Should().Be(1);
            result[0].DoctorId.Should().Be(20);
            result[0].DoctorName.Should().Be("Doctor One");
            result[0].Status.Should().Be((int)AppointmentStatus.Pending);
        }

        [Fact]
        public async Task GetDoctorTodayScheduleAsync_ShouldReturnMappedSchedule()
        {
            // Arrange
            var doctorId = 20;
            var today = DateOnly.FromDateTime(DateTime.Today);

            var appointments = new List<Appointment>
            {
                CreateAppointment(
                    appointmentId: 1,
                    patientId: 10,
                    doctorId: doctorId,
                    date: today,
                    slot: ValidSlot(),
                    status: AppointmentStatus.Pending,
                    patientName: "Patient One",
                    doctorName: "Doctor One")
            };

            _appointmentRepositoryMock
                .Setup(repo => repo.GetDoctorTodayScheduleAsync(doctorId, today))
                .ReturnsAsync(appointments);

            // Act
            var result = (await _service.GetDoctorTodayScheduleAsync(doctorId)).ToList();

            // Assert
            result.Should().HaveCount(1);
            result[0].AppointmentId.Should().Be(1);
            result[0].PatientId.Should().Be(10);
            result[0].PatientName.Should().Be("Patient One");
            result[0].Status.Should().Be((int)AppointmentStatus.Pending);
            result[0].HasHealthRecord.Should().BeFalse();
        }

        [Fact]
        public async Task GetDoctorWeekScheduleAsync_ShouldReturnMappedScheduleWithHealthRecordFlag()
        {
            // Arrange
            var doctorId = 20;
            var startDate = Tomorrow();
            var endDate = startDate.AddDays(6);

            var appointments = new List<Appointment>
            {
                CreateAppointment(
                    appointmentId: 1,
                    patientId: 10,
                    doctorId: doctorId,
                    date: startDate,
                    slot: ValidSlot(),
                    status: AppointmentStatus.Completed,
                    patientName: "Patient One",
                    doctorName: "Doctor One",
                    hasHealthRecord: true)
            };

            _appointmentRepositoryMock
                .Setup(repo => repo.GetDoctorWeekScheduleAsync(doctorId, startDate, endDate))
                .ReturnsAsync(appointments);

            // Act
            var result = (await _service.GetDoctorWeekScheduleAsync(
                doctorId,
                startDate,
                endDate)).ToList();

            // Assert
            result.Should().HaveCount(1);
            result[0].AppointmentId.Should().Be(1);
            result[0].Status.Should().Be((int)AppointmentStatus.Completed);
            result[0].HasHealthRecord.Should().BeTrue();
        }

        [Fact]
        public async Task CreateAsync_WithValidBooking_ShouldCreateAppointmentInvalidateCachePublishEventAndReturnDto()
        {
            // Arrange
            var patient = CreatePatient(10, "Patient One", true);
            var doctor = CreateDoctor(20, "Doctor One", true);

            var request = new CreateAppointmentDto
            {
                PatientId = patient.PatientId,
                DoctorId = doctor.DoctorId,
                ScheduledDate = Tomorrow(),
                TimeSlot = (int)ValidSlot()
            };

            SetupActivePatientAndDoctor(request, patient, doctor);
            SetupNoDuplicateBooking();

            _appointmentRepositoryMock
                .Setup(repo => repo.AddAsync(It.IsAny<Appointment>()))
                .Callback<Appointment>(appointment =>
                {
                    appointment.AppointmentId = 100;
                })
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _rabbitMqPublisherMock
                .Setup(publisher => publisher.PublishAsync(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask);

            _cacheMock
                .Setup(cache => cache.RemoveAsync(
                    It.IsAny<string>(),
                    It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask);

            // Act
            var result = await _service.CreateAsync(request);

            // Assert
            result.AppointmentId.Should().Be(100);
            result.PatientId.Should().Be(patient.PatientId);
            result.DoctorId.Should().Be(doctor.DoctorId);
            result.ScheduledDate.Should().Be(request.ScheduledDate);
            result.TimeSlot.Should().Be(request.TimeSlot);
            result.Status.Should().Be((int)AppointmentStatus.Pending);

            _appointmentRepositoryMock.Verify(
                repo => repo.AddAsync(It.Is<Appointment>(appointment =>
                    appointment.PatientId == patient.PatientId &&
                    appointment.DoctorId == doctor.DoctorId &&
                    appointment.ScheduledDate == request.ScheduledDate &&
                    appointment.TimeSlot == ValidSlot() &&
                    appointment.Status == AppointmentStatus.Pending)),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.RemoveAsync(
                    BuildAvailabilityCacheKey(doctor.DoctorId, request.ScheduledDate),
                    It.IsAny<CancellationToken>()),
                Times.Once);

            _rabbitMqPublisherMock.Verify(
                publisher => publisher.PublishAsync(
                    It.Is<AppointmentBookedEvent>(evt =>
                        evt.AppointmentId == 100 &&
                        evt.PatientName == "Patient One" &&
                        evt.DoctorId == doctor.DoctorId &&
                        evt.ScheduledDate == request.ScheduledDate &&
                        evt.TimeSlot == ValidSlot().ToString()),
                    It.IsAny<CancellationToken>()),
                Times.Once);
        }

        [Fact]
        public async Task CreateAsync_WhenPatientDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.PatientId))
                .ReturnsAsync((Patient?)null);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Patient not found.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WhenPatientInactive_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.PatientId))
                .ReturnsAsync(CreatePatient(request.PatientId, "Inactive Patient", false));

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Inactive patients cannot book appointments.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WhenDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.PatientId))
                .ReturnsAsync(CreatePatient(request.PatientId, "Patient", true));

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.DoctorId))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor not found.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WhenDoctorInactive_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.PatientId))
                .ReturnsAsync(CreatePatient(request.PatientId, "Patient", true));

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.DoctorId))
                .ReturnsAsync(CreateDoctor(request.DoctorId, "Inactive Doctor", false));

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Inactive doctor.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WithPastDate_ShouldThrowArgumentException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();
            request.ScheduledDate = DateOnly.FromDateTime(DateTime.Today.AddDays(-1));

            SetupActivePatientAndDoctor(request);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Appointment date cannot be in the past.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WithDateMoreThanThirtyDaysAhead_ShouldThrowArgumentException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();
            request.ScheduledDate = DateOnly.FromDateTime(DateTime.Today.AddDays(31));

            SetupActivePatientAndDoctor(request);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Appointments can be booked only for the next 30 days.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WithInvalidSlot_ShouldThrowArgumentException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();
            request.TimeSlot = 999999;

            SetupActivePatientAndDoctor(request);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid appointment slot.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WhenPatientAlreadyHasAppointmentWithSameDoctorSameDate_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            SetupActivePatientAndDoctor(request);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    request.PatientId,
                    request.DoctorId,
                    request.ScheduledDate))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient already has an appointment with this doctor on the selected date.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WhenPatientAlreadyHasSameSlotSameDate_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            SetupActivePatientAndDoctor(request);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    request.PatientId,
                    request.DoctorId,
                    request.ScheduledDate))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameSlotSameDateAsync(
                    request.PatientId,
                    request.ScheduledDate,
                    request.TimeSlot))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient already has another appointment in this time slot.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task CreateAsync_WhenDoctorAlreadyBookedSameSlotSameDate_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var request = CreateValidCreateAppointmentDto();

            SetupActivePatientAndDoctor(request);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    request.PatientId,
                    request.DoctorId,
                    request.ScheduledDate))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameSlotSameDateAsync(
                    request.PatientId,
                    request.ScheduledDate,
                    request.TimeSlot))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSameDoctorSameSlotSameDateAsync(
                    request.DoctorId,
                    request.ScheduledDate,
                    request.TimeSlot))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.CreateAsync(request);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor is already booked for this time slot.");

            VerifyAppointmentWasNotCreatedOrPublished();
        }

        [Fact]
        public async Task UpdateAsync_WithValidInput_ShouldUpdateAppointmentAndInvalidateOldAndNewAvailabilityCache()
        {
            // Arrange
            var existingAppointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Pending,
                patientName: "Patient",
                doctorName: "Doctor");

            var dto = new UpdateAppointmentDto
            {
                DoctorId = 30,
                ScheduledDate = Tomorrow().AddDays(1),
                TimeSlot = (int)ValidSlot()
            };

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(existingAppointment);

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(existingAppointment.PatientId))
                .ReturnsAsync(CreatePatient(existingAppointment.PatientId, "Patient", true));

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync(CreateDoctor(dto.DoctorId, "New Doctor", true));

            SetupNoDuplicateUpdateBooking(existingAppointment, dto);

            _appointmentRepositoryMock
                .Setup(repo => repo.UpdateAsync(It.IsAny<Appointment>()))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _cacheMock
                .Setup(cache => cache.RemoveAsync(
                    It.IsAny<string>(),
                    It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask);

            var oldCacheKey = BuildAvailabilityCacheKey(
                existingAppointment.DoctorId,
                existingAppointment.ScheduledDate);

            var newCacheKey = BuildAvailabilityCacheKey(
                dto.DoctorId,
                dto.ScheduledDate);

            // Act
            await _service.UpdateAsync(1, dto);

            // Assert
            existingAppointment.DoctorId.Should().Be(dto.DoctorId);
            existingAppointment.ScheduledDate.Should().Be(dto.ScheduledDate);
            existingAppointment.TimeSlot.Should().Be((AppointmentTimeSlot)dto.TimeSlot);

            _appointmentRepositoryMock.Verify(
                repo => repo.UpdateAsync(existingAppointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.RemoveAsync(oldCacheKey, It.IsAny<CancellationToken>()),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.RemoveAsync(newCacheKey, It.IsAny<CancellationToken>()),
                Times.Once);
        }

        [Fact]
        public async Task UpdateAsync_WhenAppointmentDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            var dto = CreateValidUpdateAppointmentDto();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(999))
                .ReturnsAsync((Appointment?)null);

            // Act
            var action = async () => await _service.UpdateAsync(999, dto);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Appointment 999 not found.");
        }

        [Theory]
        [InlineData(AppointmentStatus.Completed, "Completed appointments cannot be modified.")]
        [InlineData(AppointmentStatus.Cancelled, "Cancelled appointments cannot be modified.")]
        public async Task UpdateAsync_WhenAppointmentCannotBeModified_ShouldThrowInvalidOperationException(
            AppointmentStatus status,
            string expectedMessage)
        {
            // Arrange
            var appointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: status,
                patientName: "Patient",
                doctorName: "Doctor");

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            // Act
            var action = async () =>
                await _service.UpdateAsync(1, CreateValidUpdateAppointmentDto());

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage(expectedMessage);
        }

        [Fact]
        public async Task UpdateAsync_WhenUpdatedPatientDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            var existingAppointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Pending,
                patientName: "Patient",
                doctorName: "Doctor");

            var dto = CreateValidUpdateAppointmentDto();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(existingAppointment);

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(existingAppointment.PatientId))
                .ReturnsAsync((Patient?)null);

            // Act
            var action = async () => await _service.UpdateAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Patient not found.");
        }

        [Fact]
        public async Task UpdateAsync_WhenUpdatedDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            var existingAppointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Pending,
                patientName: "Patient",
                doctorName: "Doctor");

            var dto = CreateValidUpdateAppointmentDto();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(existingAppointment);

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(existingAppointment.PatientId))
                .ReturnsAsync(CreatePatient(existingAppointment.PatientId, "Patient", true));

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () => await _service.UpdateAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor not found.");
        }

        [Fact]
        public async Task UpdateAsync_WhenDuplicateDoctorSameDateExists_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreatePendingAppointmentForUpdate();
            var dto = CreateValidUpdateAppointmentDto();

            SetupValidUpdateBase(appointment, dto);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    appointment.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate,
                    appointment.AppointmentId))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.UpdateAsync(appointment.AppointmentId, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient already has an appointment with this doctor on the selected date.");
        }

        [Fact]
        public async Task UpdateAsync_WhenDuplicatePatientSameSlotExists_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreatePendingAppointmentForUpdate();
            var dto = CreateValidUpdateAppointmentDto();

            SetupValidUpdateBase(appointment, dto);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    appointment.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate,
                    appointment.AppointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameSlotSameDateAsync(
                    appointment.PatientId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    appointment.AppointmentId))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.UpdateAsync(appointment.AppointmentId, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient already has another appointment in this time slot.");
        }

        [Fact]
        public async Task UpdateAsync_WhenDuplicateDoctorSameSlotExists_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreatePendingAppointmentForUpdate();
            var dto = CreateValidUpdateAppointmentDto();

            SetupValidUpdateBase(appointment, dto);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    appointment.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate,
                    appointment.AppointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameSlotSameDateAsync(
                    appointment.PatientId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    appointment.AppointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSameDoctorSameSlotSameDateAsync(
                    dto.DoctorId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    appointment.AppointmentId))
                .ReturnsAsync(true);

            // Act
            var action = async () => await _service.UpdateAsync(appointment.AppointmentId, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor is already booked for this time slot.");
        }

        [Fact]
        public async Task UpdateStatusAsync_WhenAppointmentDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Appointment 1 not found.");
        }

        [Fact]
        public async Task UpdateStatusAsync_WithInvalidStatus_ShouldThrowArgumentException()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = 999999
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid appointment status.");
        }

        [Fact]
        public async Task UpdateStatusAsync_ConfirmPendingAppointment_ShouldUpdateStatus()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupUpdateAndSave();

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            // Act
            await _service.UpdateStatusAsync(1, dto);

            // Assert
            appointment.Status.Should().Be(AppointmentStatus.Confirmed);

            _appointmentRepositoryMock.Verify(
                repo => repo.UpdateAsync(appointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);

            _cacheMock.Verify(
                cache => cache.RemoveAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task UpdateStatusAsync_ConfirmNonPendingAppointment_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreateConfirmedAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only pending appointments can be confirmed.");
        }

        [Fact]
        public async Task UpdateStatusAsync_CompleteConfirmedAppointment_ShouldUpdateStatus()
        {
            // Arrange
            var appointment = CreateConfirmedAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupUpdateAndSave();

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Completed
            };

            // Act
            await _service.UpdateStatusAsync(1, dto);

            // Assert
            appointment.Status.Should().Be(AppointmentStatus.Completed);

            _cacheMock.Verify(
                cache => cache.RemoveAsync(It.IsAny<string>(), It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task UpdateStatusAsync_CompleteNonConfirmedAppointment_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Completed
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only confirmed appointments can be completed.");
        }

        [Fact]
        public async Task UpdateStatusAsync_CancelWithoutReason_ShouldThrowArgumentException()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Cancelled,
                CancellationReason = ""
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Cancellation reason is required.");
        }

        [Fact]
        public async Task UpdateStatusAsync_CancelWithReason_ShouldCancelAndInvalidateCache()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupUpdateAndSave();
            SetupCacheRemove();

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Cancelled,
                CancellationReason = " Doctor unavailable "
            };

            // Act
            await _service.UpdateStatusAsync(1, dto);

            // Assert
            appointment.Status.Should().Be(AppointmentStatus.Cancelled);
            appointment.CancellationReason.Should().Be("Doctor unavailable");

            _cacheMock.Verify(
                cache => cache.RemoveAsync(
                    BuildAvailabilityCacheKey(appointment.DoctorId, appointment.ScheduledDate),
                    It.IsAny<CancellationToken>()),
                Times.Once);
        }

        [Fact]
        public async Task UpdateStatusAsync_BackToPending_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreateConfirmedAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Pending
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Cannot manually change appointment back to Pending.");
        }

        [Theory]
        [InlineData(AppointmentStatus.Completed, "Completed appointments cannot be modified.")]
        [InlineData(AppointmentStatus.Cancelled, "Cancelled appointments cannot be modified.")]
        public async Task UpdateStatusAsync_WhenCurrentStatusIsFinal_ShouldThrowInvalidOperationException(
            AppointmentStatus currentStatus,
            string expectedMessage)
        {
            // Arrange
            var appointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: currentStatus,
                patientName: "Patient",
                doctorName: "Doctor");

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            // Act
            var action = async () => await _service.UpdateStatusAsync(1, dto);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage(expectedMessage);
        }

        [Fact]
        public async Task ConfirmAsync_WithPendingAppointment_ShouldConfirm()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupUpdateAndSave();

            // Act
            await _service.ConfirmAsync(1);

            // Assert
            appointment.Status.Should().Be(AppointmentStatus.Confirmed);

            _appointmentRepositoryMock.Verify(
                repo => repo.UpdateAsync(appointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task ConfirmAsync_WhenAppointmentDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            // Act
            var action = async () => await _service.ConfirmAsync(1);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>();
        }

        [Fact]
        public async Task ConfirmAsync_WhenAppointmentNotPending_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreateConfirmedAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            // Act
            var action = async () => await _service.ConfirmAsync(1);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only pending appointments can be confirmed.");
        }

        [Fact]
        public async Task CompleteAsync_WithConfirmedAppointment_ShouldComplete()
        {
            // Arrange
            var appointment = CreateConfirmedAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupUpdateAndSave();

            // Act
            await _service.CompleteAsync(1);

            // Assert
            appointment.Status.Should().Be(AppointmentStatus.Completed);

            _appointmentRepositoryMock.Verify(
                repo => repo.UpdateAsync(appointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task CompleteAsync_WhenAppointmentDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            // Act
            var action = async () => await _service.CompleteAsync(1);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>();
        }

        [Fact]
        public async Task CompleteAsync_WhenAppointmentNotConfirmed_ShouldThrowInvalidOperationException()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            // Act
            var action = async () => await _service.CompleteAsync(1);

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only confirmed appointments can be completed.");
        }

        [Fact]
        public async Task CancelAsync_WithValidReason_ShouldCancelAndInvalidateCache()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupUpdateAndSave();
            SetupCacheRemove();

            var dto = new CancelAppointmentDto
            {
                CancellationReason = " Patient unavailable "
            };

            // Act
            await _service.CancelAsync(1, dto);

            // Assert
            appointment.Status.Should().Be(AppointmentStatus.Cancelled);
            appointment.CancellationReason.Should().Be("Patient unavailable");

            _cacheMock.Verify(
                cache => cache.RemoveAsync(
                    BuildAvailabilityCacheKey(appointment.DoctorId, appointment.ScheduledDate),
                    It.IsAny<CancellationToken>()),
                Times.Once);
        }

        [Fact]
        public async Task CancelAsync_WhenAppointmentDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            // Act
            var action = async () =>
                await _service.CancelAsync(1, new CancelAppointmentDto
                {
                    CancellationReason = "Reason"
                });

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>();
        }

        [Theory]
        [InlineData(AppointmentStatus.Completed, "Completed appointments cannot be cancelled.")]
        [InlineData(AppointmentStatus.Cancelled, "Appointment already cancelled.")]
        public async Task CancelAsync_WhenStatusCannotBeCancelled_ShouldThrowInvalidOperationException(
            AppointmentStatus status,
            string expectedMessage)
        {
            // Arrange
            var appointment = CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: status,
                patientName: "Patient",
                doctorName: "Doctor");

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            // Act
            var action = async () =>
                await _service.CancelAsync(1, new CancelAppointmentDto
                {
                    CancellationReason = "Reason"
                });

            // Assert
            await action.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage(expectedMessage);
        }

        [Fact]
        public async Task CancelAsync_WithoutReason_ShouldThrowArgumentException()
        {
            // Arrange
            var appointment = CreatePendingAppointment();

            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            // Act
            var action = async () =>
                await _service.CancelAsync(1, new CancelAppointmentDto
                {
                    CancellationReason = ""
                });

            // Assert
            await action.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Cancellation reason is required.");
        }

        [Fact]
        public async Task GetDoctorUpcomingScheduleAsync_ShouldReturnNextSevenDaysSchedule()
        {
            // Arrange
            var doctorId = 20;
            var startDate = DateOnly.FromDateTime(DateTime.Today);
            var endDate = startDate.AddDays(7);

            var appointments = new List<Appointment>
            {
                CreateAppointment(
                    appointmentId: 1,
                    patientId: 10,
                    doctorId: doctorId,
                    date: Tomorrow(),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Pending,
                    patientName: "Patient",
                    doctorName: "Doctor")
            };

            _appointmentRepositoryMock
                .Setup(repo => repo.GetDoctorWeekScheduleAsync(doctorId, startDate, endDate))
                .ReturnsAsync(appointments);

            // Act
            var result = (await _service.GetDoctorUpcomingScheduleAsync(doctorId)).ToList();

            // Assert
            result.Should().HaveCount(1);
            result[0].AppointmentId.Should().Be(1);

            _appointmentRepositoryMock.Verify(
                repo => repo.GetDoctorWeekScheduleAsync(doctorId, startDate, endDate),
                Times.Once);
        }

        [Fact]
        public async Task GetDoctorPatientsAsync_WhenDoctorDoesNotExist_ShouldThrowKeyNotFoundException()
        {
            // Arrange
            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(20))
                .ReturnsAsync((Doctor?)null);

            // Act
            var action = async () => await _service.GetDoctorPatientsAsync(20);

            // Assert
            await action.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 20 not found.");
        }

        [Fact]
        public async Task GetDoctorPatientsAsync_WhenDoctorExists_ShouldReturnGroupedPatientsOrderedByName()
        {
            // Arrange
            var doctorId = 20;

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(doctorId))
                .ReturnsAsync(CreateDoctor(doctorId, "Doctor", true));

            var patientB = CreatePatient(10, "Patient B", true);
            var patientA = CreatePatient(11, "Patient A", true);

            var appointments = new List<Appointment>
            {
                CreateAppointment(
                    appointmentId: 1,
                    patientId: patientB.PatientId,
                    doctorId: doctorId,
                    date: Tomorrow(),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Completed,
                    patientName: patientB.FullName,
                    doctorName: "Doctor"),

                CreateAppointment(
                    appointmentId: 2,
                    patientId: patientB.PatientId,
                    doctorId: doctorId,
                    date: Tomorrow().AddDays(2),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Completed,
                    patientName: patientB.FullName,
                    doctorName: "Doctor"),

                CreateAppointment(
                    appointmentId: 3,
                    patientId: patientA.PatientId,
                    doctorId: doctorId,
                    date: Tomorrow().AddDays(1),
                    slot: ValidSlot(),
                    status: AppointmentStatus.Completed,
                    patientName: patientA.FullName,
                    doctorName: "Doctor")
            };

            appointments[0].Patient = patientB;
            appointments[1].Patient = patientB;
            appointments[2].Patient = patientA;

            _appointmentRepositoryMock
                .Setup(repo => repo.GetDoctorPatientAppointmentsAsync(doctorId))
                .ReturnsAsync(appointments);

            // Act
            var result = (await _service.GetDoctorPatientsAsync(doctorId)).ToList();

            // Assert
            result.Should().HaveCount(2);

            result[0].FullName.Should().Be("Patient A");
            result[0].TotalAppointments.Should().Be(1);

            result[1].FullName.Should().Be("Patient B");
            result[1].TotalAppointments.Should().Be(2);
            result[1].LastVisitDate.Should().Be(Tomorrow().AddDays(2));
        }

        private void SetupActivePatientAndDoctor(CreateAppointmentDto request)
        {
            SetupActivePatientAndDoctor(
                request,
                CreatePatient(request.PatientId, "Patient", true),
                CreateDoctor(request.DoctorId, "Doctor", true));
        }

        private void SetupActivePatientAndDoctor(
            CreateAppointmentDto request,
            Patient patient,
            Doctor doctor)
        {
            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.PatientId))
                .ReturnsAsync(patient);

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(request.DoctorId))
                .ReturnsAsync(doctor);
        }

        private void SetupNoDuplicateBooking()
        {
            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    It.IsAny<int>(),
                    It.IsAny<int>(),
                    It.IsAny<DateOnly>()))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameSlotSameDateAsync(
                    It.IsAny<int>(),
                    It.IsAny<DateOnly>(),
                    It.IsAny<int>()))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSameDoctorSameSlotSameDateAsync(
                    It.IsAny<int>(),
                    It.IsAny<DateOnly>(),
                    It.IsAny<int>()))
                .ReturnsAsync(false);
        }

        private void SetupValidUpdateBase(
            Appointment appointment,
            UpdateAppointmentDto dto)
        {
            _appointmentRepositoryMock
                .Setup(repo => repo.GetByIdAsync(appointment.AppointmentId))
                .ReturnsAsync(appointment);

            _patientRepositoryMock
                .Setup(repo => repo.GetByIdAsync(appointment.PatientId))
                .ReturnsAsync(CreatePatient(appointment.PatientId, "Patient", true));

            _doctorRepositoryMock
                .Setup(repo => repo.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync(CreateDoctor(dto.DoctorId, "Doctor", true));
        }

        private void SetupNoDuplicateUpdateBooking(
            Appointment existingAppointment,
            UpdateAppointmentDto dto)
        {
            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameDoctorSameDateAsync(
                    existingAppointment.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate,
                    existingAppointment.AppointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSamePatientSameSlotSameDateAsync(
                    existingAppointment.PatientId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    existingAppointment.AppointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repo => repo.ExistsSameDoctorSameSlotSameDateAsync(
                    dto.DoctorId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    existingAppointment.AppointmentId))
                .ReturnsAsync(false);
        }

        private void SetupUpdateAndSave()
        {
            _appointmentRepositoryMock
                .Setup(repo => repo.UpdateAsync(It.IsAny<Appointment>()))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repo => repo.SaveChangesAsync())
                .Returns(Task.CompletedTask);
        }

        private void SetupCacheRemove()
        {
            _cacheMock
                .Setup(cache => cache.RemoveAsync(
                    It.IsAny<string>(),
                    It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask);
        }

        private void VerifyAppointmentWasNotCreatedOrPublished()
        {
            _appointmentRepositoryMock.Verify(
                repo => repo.AddAsync(It.IsAny<Appointment>()),
                Times.Never);

            _appointmentRepositoryMock.Verify(
                repo => repo.SaveChangesAsync(),
                Times.Never);

            _rabbitMqPublisherMock.Verify(
                publisher => publisher.PublishAsync(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);

            _cacheMock.Verify(
                cache => cache.RemoveAsync(
                    It.IsAny<string>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);
        }

        private static CreateAppointmentDto CreateValidCreateAppointmentDto()
        {
            return new CreateAppointmentDto
            {
                PatientId = 10,
                DoctorId = 20,
                ScheduledDate = Tomorrow(),
                TimeSlot = (int)ValidSlot()
            };
        }

        private static UpdateAppointmentDto CreateValidUpdateAppointmentDto()
        {
            return new UpdateAppointmentDto
            {
                DoctorId = 30,
                ScheduledDate = Tomorrow().AddDays(1),
                TimeSlot = (int)ValidSlot()
            };
        }

        private static Appointment CreatePendingAppointment()
        {
            return CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Pending,
                patientName: "Patient",
                doctorName: "Doctor");
        }

        private static Appointment CreateConfirmedAppointment()
        {
            return CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Confirmed,
                patientName: "Patient",
                doctorName: "Doctor");
        }

        private static Appointment CreatePendingAppointmentForUpdate()
        {
            return CreateAppointment(
                appointmentId: 1,
                patientId: 10,
                doctorId: 20,
                date: Tomorrow(),
                slot: ValidSlot(),
                status: AppointmentStatus.Pending,
                patientName: "Patient",
                doctorName: "Doctor");
        }

        private static Appointment CreateAppointment(
            int appointmentId,
            int patientId,
            int doctorId,
            DateOnly date,
            AppointmentTimeSlot slot,
            AppointmentStatus status,
            string patientName,
            string doctorName,
            string? cancellationReason = null,
            bool hasHealthRecord = false)
        {
            var appointment = new Appointment
            {
                AppointmentId = appointmentId,
                PatientId = patientId,
                DoctorId = doctorId,
                ScheduledDate = date,
                TimeSlot = slot,
                Status = status,
                CancellationReason = cancellationReason,
                Patient = CreatePatient(patientId, patientName, true),
                Doctor = CreateDoctor(doctorId, doctorName, true)
            };

            if (hasHealthRecord)
            {
                appointment.HealthRecord = new HealthRecord
                {
                    HealthRecordId = 1,
                    AppointmentId = appointmentId,
                    PatientId = patientId,
                    DoctorId = doctorId,
                    Diagnosis = "Diagnosis",
                    Prescription = "Prescription",
                    CreatedOn = DateTime.UtcNow
                };
            }

            return appointment;
        }

        private static Patient CreatePatient(
            int patientId,
            string fullName,
            bool isActive)
        {
            return new Patient
            {
                PatientId = patientId,
                FullName = fullName,
                DateOfBirth = new DateOnly(1990, 1, 1),
                Gender = Gender.Male,
                PhoneNumber = "9999999999",
                Email = $"{fullName.Replace(" ", "").ToLower()}@test.com",
                InsuranceNumber = "INS123",
                IsActive = isActive
            };
        }

        private static Doctor CreateDoctor(
            int doctorId,
            string fullName,
            bool isActive)
        {
            return new Doctor
            {
                DoctorId = doctorId,
                FullName = fullName,
                Email = $"{fullName.Replace(" ", "").ToLower()}@test.com",
                Specialisation = ValidSpecialisation(),
                YearsOfExperience = 10,
                ConsultationFee = 500,
                IsActive = isActive
            };
        }

        private static DateOnly Tomorrow()
        {
            return DateOnly.FromDateTime(DateTime.Today.AddDays(1));
        }

        private static AppointmentTimeSlot ValidSlot()
        {
            return Enum.GetValues<AppointmentTimeSlot>().First();
        }

        private static DoctorSpecialisation ValidSpecialisation()
        {
            return Enum.GetValues<DoctorSpecialisation>().First();
        }

        private static string BuildAvailabilityCacheKey(
            int doctorId,
            DateOnly date)
        {
            return $"doctors:{doctorId}:availability:{date:yyyy-MM-dd}";
        }
    }
}