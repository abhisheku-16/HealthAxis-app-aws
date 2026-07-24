using FluentAssertions;
using MassTransit;
using Microsoft.Extensions.Logging;
using Moq;
using S4_HealthAxis.Shared.DTOs.Appointment;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Events;
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
        private readonly Mock<IPublishEndpoint> _publishEndpointMock;
        private readonly Mock<ILogger<AppointmentService>> _loggerMock;

        private readonly AppointmentService _service;

        public AppointmentServiceTests()
        {
            _appointmentRepositoryMock =
                new Mock<IAppointmentRepository>(MockBehavior.Strict);

            _patientRepositoryMock =
                new Mock<IPatientRepository>(MockBehavior.Strict);

            _doctorRepositoryMock =
                new Mock<IDoctorRepository>(MockBehavior.Strict);

            _publishEndpointMock =
                new Mock<IPublishEndpoint>(MockBehavior.Strict);

            _loggerMock =
                new Mock<ILogger<AppointmentService>>();


            _service = new AppointmentService(
                _appointmentRepositoryMock.Object,
                _patientRepositoryMock.Object,
                _doctorRepositoryMock.Object,
                _publishEndpointMock.Object,
                _loggerMock.Object);
        }

        #region GetAllAsync

        [Fact]
        public async Task GetAllAsync_ShouldReturnMappedAppointments_WhenAppointmentsExist()
        {
            var appointments = new List<Appointment>
            {
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending),
                BuildAppointment(2, 11, 21, AppointmentStatus.Completed)
            };

            _appointmentRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(appointments);

            var result =
                (await _service.GetAllAsync()).ToList();

            result.Should().HaveCount(2);

            result[0].AppointmentId.Should().Be(1);
            result[0].PatientId.Should().Be(10);
            result[0].PatientName.Should().Be("Patient 10");
            result[0].DoctorId.Should().Be(20);
            result[0].DoctorName.Should().Be("Doctor 20");
            result[0].Status.Should().Be((int)AppointmentStatus.Pending);

            result[1].AppointmentId.Should().Be(2);
            result[1].PatientId.Should().Be(11);
            result[1].PatientName.Should().Be("Patient 11");
            result[1].DoctorId.Should().Be(21);
            result[1].DoctorName.Should().Be("Doctor 21");
            result[1].Status.Should().Be((int)AppointmentStatus.Completed);

            _appointmentRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);
        }

        [Fact]
        public async Task GetAllAsync_ShouldReturnEmptyCollection_WhenNoAppointmentsExist()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(new List<Appointment>());

            var result =
                (await _service.GetAllAsync()).ToList();

            result.Should().BeEmpty();

            _appointmentRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);
        }

        [Fact]
        public async Task GetAllAsync_ShouldMapEmptyNames_WhenNavigationPropertiesAreNull()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            appointment.Patient = null!;
            appointment.Doctor = null!;

            _appointmentRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(new List<Appointment> { appointment });

            var result =
                (await _service.GetAllAsync()).Single();

            result.PatientName.Should().BeEmpty();
            result.DoctorName.Should().BeEmpty();
        }

        [Fact]
        public async Task GetAllAsync_ShouldPropagateException_WhenRepositoryThrows()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ThrowsAsync(new InvalidOperationException("Get all failed."));

            var act =
                async () => await _service.GetAllAsync();

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Get all failed.");
        }

        #endregion

        #region GetByIdAsync

        [Fact]
        public async Task GetByIdAsync_ShouldReturnNull_WhenAppointmentDoesNotExist()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(404))
                .ReturnsAsync((Appointment?)null);

            var result =
                await _service.GetByIdAsync(404);

            result.Should().BeNull();

            _appointmentRepositoryMock.Verify(
                repository => repository.GetByIdAsync(404),
                Times.Once);
        }

        [Fact]
        public async Task GetByIdAsync_ShouldReturnMappedAppointment_WhenAppointmentExists()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Confirmed);

            appointment.CancellationReason = "Not applicable";

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var result =
                await _service.GetByIdAsync(1);

            result.Should().NotBeNull();
            result!.AppointmentId.Should().Be(1);
            result.PatientId.Should().Be(10);
            result.PatientName.Should().Be("Patient 10");
            result.DoctorId.Should().Be(20);
            result.DoctorName.Should().Be("Doctor 20");
            result.Status.Should().Be((int)AppointmentStatus.Confirmed);
            result.CancellationReason.Should().Be("Not applicable");

            _appointmentRepositoryMock.Verify(
                repository => repository.GetByIdAsync(1),
                Times.Once);
        }

        [Fact]
        public async Task GetByIdAsync_ShouldPropagateException_WhenRepositoryThrows()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ThrowsAsync(new InvalidOperationException("Lookup failed."));

            var act =
                async () => await _service.GetByIdAsync(1);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Lookup failed.");
        }

        #endregion

        #region Patient History And Doctor Schedules

        [Fact]
        public async Task GetPatientHistoryAsync_ShouldReturnMappedHistory()
        {
            var appointments = new List<Appointment>
            {
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending),
                BuildAppointment(2, 10, 21, AppointmentStatus.Completed)
            };

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByPatientIdAsync(10))
                .ReturnsAsync(appointments);

            var result =
                (await _service.GetPatientHistoryAsync(10)).ToList();

            result.Should().HaveCount(2);

            result[0].AppointmentId.Should().Be(1);
            result[0].DoctorId.Should().Be(20);
            result[0].DoctorName.Should().Be("Doctor 20");
            result[0].Status.Should().Be((int)AppointmentStatus.Pending);

            result[1].AppointmentId.Should().Be(2);
            result[1].DoctorId.Should().Be(21);
            result[1].DoctorName.Should().Be("Doctor 21");
            result[1].Status.Should().Be((int)AppointmentStatus.Completed);

            _appointmentRepositoryMock.Verify(
                repository => repository.GetByPatientIdAsync(10),
                Times.Once);
        }

        [Fact]
        public async Task GetPatientHistoryAsync_ShouldReturnEmptyCollection_WhenNoHistoryExists()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByPatientIdAsync(10))
                .ReturnsAsync(new List<Appointment>());

            var result =
                (await _service.GetPatientHistoryAsync(10)).ToList();

            result.Should().BeEmpty();

            _appointmentRepositoryMock.Verify(
                repository => repository.GetByPatientIdAsync(10),
                Times.Once);
        }

        [Fact]
        public async Task GetDoctorTodayScheduleAsync_ShouldUseTodayAndReturnMappedSchedule()
        {
            var today =
                DateOnly.FromDateTime(DateTime.Today);

            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetDoctorTodayScheduleAsync(20, today))
                .ReturnsAsync(new List<Appointment> { appointment });

            var result =
                (await _service.GetDoctorTodayScheduleAsync(20)).Single();

            result.AppointmentId.Should().Be(1);
            result.PatientId.Should().Be(10);
            result.PatientName.Should().Be("Patient 10");
            result.Status.Should().Be((int)AppointmentStatus.Pending);
            result.HasHealthRecord.Should().BeFalse();

            _appointmentRepositoryMock.Verify(
                repository => repository.GetDoctorTodayScheduleAsync(20, today),
                Times.Once);
        }

        [Fact]
        public async Task GetDoctorWeekScheduleAsync_ShouldReturnMappedScheduleWithHealthRecordFlag()
        {
            var startDate =
                DateOnly.FromDateTime(DateTime.Today);

            var endDate =
                startDate.AddDays(7);

            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Completed);

            appointment.HealthRecord = new HealthRecord
            {
                HealthRecordId = 100,
                AppointmentId = appointment.AppointmentId
            };

            _appointmentRepositoryMock
                .Setup(repository => repository.GetDoctorWeekScheduleAsync(20, startDate, endDate))
                .ReturnsAsync(new List<Appointment> { appointment });

            var result =
                (await _service.GetDoctorWeekScheduleAsync(20, startDate, endDate))
                .Single();

            result.AppointmentId.Should().Be(1);
            result.HasHealthRecord.Should().BeTrue();

            _appointmentRepositoryMock.Verify(
                repository => repository.GetDoctorWeekScheduleAsync(20, startDate, endDate),
                Times.Once);
        }

        [Fact]
        public async Task GetDoctorUpcomingScheduleAsync_ShouldUseTodayAndNextSevenDays()
        {
            var startDate =
                DateOnly.FromDateTime(DateTime.Today);

            var endDate =
                startDate.AddDays(7);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetDoctorWeekScheduleAsync(20, startDate, endDate))
                .ReturnsAsync(new List<Appointment>());

            var result =
                (await _service.GetDoctorUpcomingScheduleAsync(20)).ToList();

            result.Should().BeEmpty();

            _appointmentRepositoryMock.Verify(
                repository => repository.GetDoctorWeekScheduleAsync(20, startDate, endDate),
                Times.Once);
        }

        #endregion

        #region CreateAsync Success

        [Fact]
        public async Task CreateAsync_ShouldCreateAppointmentAndPublishEvent_WhenRequestIsValid()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupSuccessfulBookingValidation(dto);

            Appointment? capturedAppointment = null;
            AppointmentBookedEvent? capturedEvent = null;

            _appointmentRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Appointment>()))
                .Callback<Appointment>(appointment =>
                {
                    capturedAppointment = appointment;
                    appointment.AppointmentId = 999;
                })
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);


            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync(BuildPatient(dto.PatientId));

            _publishEndpointMock
                .Setup(publisher => publisher.Publish(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()))
                .Callback<AppointmentBookedEvent, CancellationToken>(
                    (appointmentEvent, _) => capturedEvent = appointmentEvent)
                .Returns(Task.CompletedTask);

            var result =
                await _service.CreateAsync(dto);

            capturedAppointment.Should().NotBeNull();
            capturedAppointment!.AppointmentId.Should().Be(999);
            capturedAppointment.PatientId.Should().Be(dto.PatientId);
            capturedAppointment.DoctorId.Should().Be(dto.DoctorId);
            capturedAppointment.ScheduledDate.Should().Be(dto.ScheduledDate);
            capturedAppointment.TimeSlot.Should().Be((AppointmentTimeSlot)dto.TimeSlot);
            capturedAppointment.Status.Should().Be(AppointmentStatus.Pending);

            result.AppointmentId.Should().Be(999);
            result.PatientId.Should().Be(dto.PatientId);
            result.DoctorId.Should().Be(dto.DoctorId);
            result.ScheduledDate.Should().Be(dto.ScheduledDate);
            result.TimeSlot.Should().Be(dto.TimeSlot);
            result.Status.Should().Be((int)AppointmentStatus.Pending);

            capturedEvent.Should().NotBeNull();
            capturedEvent!.AppointmentId.Should().Be(999);
            capturedEvent.PatientName.Should().Be($"Patient {dto.PatientId}");
            capturedEvent.DoctorId.Should().Be(dto.DoctorId);
            capturedEvent.ScheduledDate.Should().Be(dto.ScheduledDate);
            capturedEvent.TimeSlot.Should().Be(((AppointmentTimeSlot)dto.TimeSlot).ToString());

            _appointmentRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Appointment>()),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);


            _publishEndpointMock.Verify(
                publisher => publisher.Publish(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()),
                Times.Once);
        }

        //[Fact]
        //public async Task CreateAsync_ShouldPublishPatientFallbackName_WhenPatientLookupAfterSaveReturnsNull()
        //{
        //    var dto =
        //        BuildValidCreateAppointmentDto();

        //    SetupSuccessfulBookingValidation(dto);

        //    _appointmentRepositoryMock
        //        .Setup(repository => repository.AddAsync(It.IsAny<Appointment>()))
        //        .Callback<Appointment>(appointment => appointment.AppointmentId = 555)
        //        .Returns(Task.CompletedTask);

        //    _appointmentRepositoryMock
        //        .Setup(repository => repository.SaveChangesAsync())
        //        .Returns(Task.CompletedTask);

        //    _cacheMock
        //        .Setup(cache => cache.RemoveAsync(
        //            It.IsAny<string>(),
        //            It.IsAny<CancellationToken>()))
        //        .Returns(Task.CompletedTask);

        //    _patientRepositoryMock
        //        .Setup(repository => repository.GetByIdAsync(dto.PatientId))
        //        .ReturnsAsync((Patient?)null);

        //    AppointmentBookedEvent? capturedEvent = null;

        //    _publishEndpointMock
        //        .Setup(publisher => publisher.Publish(
        //            It.IsAny<AppointmentBookedEvent>(),
        //            It.IsAny<CancellationToken>()))
        //        .Callback<AppointmentBookedEvent, CancellationToken>(
        //            (appointmentEvent, _) => capturedEvent = appointmentEvent)
        //        .Returns(Task.CompletedTask);

        //    await _service.CreateAsync(dto);

        //    capturedEvent.Should().NotBeNull();
        //    capturedEvent!.PatientName.Should().Be("Patient");
        //}

        [Fact]
        public async Task CreateAsync_ShouldNotPublishEvent_WhenAddFails()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupSuccessfulBookingValidation(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Appointment>()))
                .ThrowsAsync(new InvalidOperationException("Add failed."));

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Add failed.");

            _appointmentRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _publishEndpointMock.Verify(
                publisher => publisher.Publish(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateAsync_ShouldNotPublishEvent_WhenSaveFails()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupSuccessfulBookingValidation(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Appointment>()))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Save failed."));

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Save failed.");

            _publishEndpointMock.Verify(
                publisher => publisher.Publish(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateAsync_ShouldPropagateException_WhenMassTransitPublishFails()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupSuccessfulBookingValidation(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Appointment>()))
                .Callback<Appointment>(appointment => appointment.AppointmentId = 1000)
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);


            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync(BuildPatient(dto.PatientId));

            _publishEndpointMock
                .Setup(publisher => publisher.Publish(
                    It.IsAny<AppointmentBookedEvent>(),
                    It.IsAny<CancellationToken>()))
                .ThrowsAsync(new InvalidOperationException("Publish failed."));

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Publish failed.");
        }

        #endregion

        #region CreateAsync Validation Failures

        [Fact]
        public async Task CreateAsync_ShouldThrowKeyNotFoundException_WhenPatientDoesNotExist()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync((Patient?)null);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Patient not found.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(It.IsAny<int>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowInvalidOperationException_WhenPatientIsInactive()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync(BuildPatient(dto.PatientId, isActive: false));

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Inactive patients cannot book appointments.");

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(It.IsAny<int>()),
                Times.Never);
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowKeyNotFoundException_WhenDoctorDoesNotExist()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync(BuildPatient(dto.PatientId));

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync((Doctor?)null);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor not found.");
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowInvalidOperationException_WhenDoctorIsInactive()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync(BuildPatient(dto.PatientId));

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync(BuildDoctor(dto.DoctorId, isActive: false));

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Inactive doctor.");
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenAppointmentDateIsInPast()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            dto.ScheduledDate =
                DateOnly.FromDateTime(DateTime.Today.AddDays(-1));

            SetupPatientAndDoctor(dto);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Appointment date cannot be in the past.");
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenAppointmentDateIsMoreThanThirtyDaysAhead()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            dto.ScheduledDate =
                DateOnly.FromDateTime(DateTime.Today.AddDays(31));

            SetupPatientAndDoctor(dto);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Appointments can be booked only for the next 30 days.");
        }

        [Theory]
        [InlineData(-1)]
        [InlineData(999)]
        public async Task CreateAsync_ShouldThrowArgumentException_WhenTimeSlotIsInvalid(
            int timeSlot)
        {
            var dto =
                BuildValidCreateAppointmentDto();

            dto.TimeSlot = timeSlot;

            SetupPatientAndDoctor(dto);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid appointment slot.");
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowInvalidOperationException_WhenSamePatientSameDoctorSameDateExists()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupPatientAndDoctor(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameDoctorSameDateAsync(
                    dto.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate))
                .ReturnsAsync(true);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient already has an appointment with this doctor on the selected date.");
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowInvalidOperationException_WhenSamePatientSameSlotSameDateExists()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupPatientAndDoctor(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameDoctorSameDateAsync(
                    dto.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameSlotSameDateAsync(
                    dto.PatientId,
                    dto.ScheduledDate,
                    dto.TimeSlot))
                .ReturnsAsync(true);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient already has another appointment in this time slot.");
        }

        [Fact]
        public async Task CreateAsync_ShouldThrowInvalidOperationException_WhenDoctorSameSlotSameDateExists()
        {
            var dto =
                BuildValidCreateAppointmentDto();

            SetupPatientAndDoctor(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameDoctorSameDateAsync(
                    dto.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameSlotSameDateAsync(
                    dto.PatientId,
                    dto.ScheduledDate,
                    dto.TimeSlot))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSameDoctorSameSlotSameDateAsync(
                    dto.DoctorId,
                    dto.ScheduledDate,
                    dto.TimeSlot))
                .ReturnsAsync(true);

            var act =
                async () => await _service.CreateAsync(dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor is already booked for this time slot.");
        }

        #endregion

        #region UpdateAsync

        [Fact]
        public async Task UpdateAsync_ShouldThrowKeyNotFoundException_WhenAppointmentDoesNotExist()
        {
            var dto =
                BuildValidUpdateAppointmentDto();

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(404))
                .ReturnsAsync((Appointment?)null);

            var act =
                async () => await _service.UpdateAsync(404, dto);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Appointment 404 not found.");
        }

        [Theory]
        [InlineData(AppointmentStatus.Completed, "Completed appointments cannot be modified.")]
        [InlineData(AppointmentStatus.Cancelled, "Cancelled appointments cannot be modified.")]
        public async Task UpdateAsync_ShouldThrowInvalidOperationException_WhenAppointmentCannotBeModified(
            AppointmentStatus status,
            string expectedMessage)
        {
            var dto =
                BuildValidUpdateAppointmentDto();

            var appointment =
                BuildAppointment(1, 10, 20, status);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var act =
                async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage(expectedMessage);
        }

        [Fact]
        public async Task UpdateAsync_ShouldUpdateAppointment_WhenValid()
        {
            var oldDate =
                DateOnly.FromDateTime(DateTime.Today.AddDays(2));

            var newDate =
                DateOnly.FromDateTime(DateTime.Today.AddDays(3));

            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            appointment.ScheduledDate = oldDate;
            appointment.TimeSlot = AppointmentTimeSlot.TenAM;

            var dto = new UpdateAppointmentDto
            {
                DoctorId = 21,
                ScheduledDate = newDate,
                TimeSlot = (int)AppointmentTimeSlot.TwoPM
            };

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            SetupSuccessfulUpdateBookingValidation(
                appointment.AppointmentId,
                appointment.PatientId,
                dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            await _service.UpdateAsync(1, dto);

            appointment.DoctorId.Should().Be(21);
            appointment.ScheduledDate.Should().Be(newDate);
            appointment.TimeSlot.Should().Be(AppointmentTimeSlot.TwoPM);

            _appointmentRepositoryMock.Verify(
                repository => repository.UpdateAsync(appointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

        }

        [Fact]
        public async Task UpdateAsync_ShouldThrowKeyNotFoundException_WhenNewDoctorDoesNotExist()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            var dto =
                BuildValidUpdateAppointmentDto();

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(10))
                .ReturnsAsync(BuildPatient(10));

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync((Doctor?)null);

            var act =
                async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor not found.");
        }

        [Fact]
        public async Task UpdateAsync_ShouldThrowInvalidOperationException_WhenUpdateDuplicateDoctorSlotExists()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            var dto =
                BuildValidUpdateAppointmentDto();

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(10))
                .ReturnsAsync(BuildPatient(10));

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync(BuildDoctor(dto.DoctorId));

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameDoctorSameDateAsync(
                    10,
                    dto.DoctorId,
                    dto.ScheduledDate,
                    1))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameSlotSameDateAsync(
                    10,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    1))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSameDoctorSameSlotSameDateAsync(
                    dto.DoctorId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    1))
                .ReturnsAsync(true);

            var act =
                async () => await _service.UpdateAsync(1, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Doctor is already booked for this time slot.");
        }

        #endregion

        #region UpdateStatusAsync

        [Fact]
        public async Task UpdateStatusAsync_ShouldThrowKeyNotFoundException_WhenAppointmentDoesNotExist()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(404))
                .ReturnsAsync((Appointment?)null);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            var act =
                async () => await _service.UpdateStatusAsync(404, dto);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Appointment 404 not found.");
        }

        [Theory]
        [InlineData(-1)]
        [InlineData(999)]
        public async Task UpdateStatusAsync_ShouldThrowArgumentException_WhenStatusIsInvalid(
            int status)
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = status
            };

            var act =
                async () => await _service.UpdateStatusAsync(1, dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Invalid appointment status.");
        }

        [Theory]
        [InlineData(AppointmentStatus.Completed, "Completed appointments cannot be modified.")]
        [InlineData(AppointmentStatus.Cancelled, "Cancelled appointments cannot be modified.")]
        public async Task UpdateStatusAsync_ShouldThrowInvalidOperationException_WhenCurrentStatusCannotBeModified(
            AppointmentStatus currentStatus,
            string expectedMessage)
        {
            var appointment =
                BuildAppointment(1, 10, 20, currentStatus);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            var act =
                async () => await _service.UpdateStatusAsync(1, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage(expectedMessage);
        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldThrowInvalidOperationException_WhenChangingBackToPending()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Confirmed);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Pending
            };

            var act =
                async () => await _service.UpdateStatusAsync(1, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Cannot manually change appointment back to Pending.");
        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldConfirmPendingAppointment()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            await _service.UpdateStatusAsync(1, dto);

            appointment.Status.Should().Be(AppointmentStatus.Confirmed);

        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldThrowInvalidOperationException_WhenConfirmingNonPendingAppointment()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Confirmed);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Confirmed
            };

            var act =
                async () => await _service.UpdateStatusAsync(1, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only pending appointments can be confirmed.");
        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldCompleteConfirmedAppointment()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Confirmed);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Completed
            };

            await _service.UpdateStatusAsync(1, dto);

            appointment.Status.Should().Be(AppointmentStatus.Completed);
        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldThrowInvalidOperationException_WhenCompletingNonConfirmedAppointment()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Completed
            };

            var act =
                async () => await _service.UpdateStatusAsync(1, dto);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only confirmed appointments can be completed.");
        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldCancelAppointmentAndInvalidateCache()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            appointment.ScheduledDate =
                DateOnly.FromDateTime(DateTime.Today.AddDays(5));

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);


            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Cancelled,
                CancellationReason = "  Patient requested cancellation  "
            };

            await _service.UpdateStatusAsync(1, dto);

            appointment.Status.Should().Be(AppointmentStatus.Cancelled);
            appointment.CancellationReason.Should().Be("Patient requested cancellation");

        }

        [Fact]
        public async Task UpdateStatusAsync_ShouldThrowArgumentException_WhenCancellationReasonIsMissing()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var dto = new UpdateAppointmentStatusDto
            {
                Status = (int)AppointmentStatus.Cancelled,
                CancellationReason = "   "
            };

            var act =
                async () => await _service.UpdateStatusAsync(1, dto);

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Cancellation reason is required.");
        }

        #endregion

        #region ConfirmAsync

        [Fact]
        public async Task ConfirmAsync_ShouldConfirmPendingAppointment()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            await _service.ConfirmAsync(1);

            appointment.Status.Should().Be(AppointmentStatus.Confirmed);

            _appointmentRepositoryMock.Verify(
                repository => repository.UpdateAsync(appointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task ConfirmAsync_ShouldThrowKeyNotFoundException_WhenAppointmentDoesNotExist()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            var act =
                async () => await _service.ConfirmAsync(1);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>();
        }

        [Theory]
        [InlineData(AppointmentStatus.Confirmed)]
        [InlineData(AppointmentStatus.Completed)]
        [InlineData(AppointmentStatus.Cancelled)]
        public async Task ConfirmAsync_ShouldThrowInvalidOperationException_WhenAppointmentIsNotPending(
            AppointmentStatus status)
        {
            var appointment =
                BuildAppointment(1, 10, 20, status);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var act =
                async () => await _service.ConfirmAsync(1);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only pending appointments can be confirmed.");
        }

        #endregion

        #region CompleteAsync

        [Fact]
        public async Task CompleteAsync_ShouldCompleteConfirmedAppointment()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Confirmed);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            await _service.CompleteAsync(1);

            appointment.Status.Should().Be(AppointmentStatus.Completed);

            _appointmentRepositoryMock.Verify(
                repository => repository.UpdateAsync(appointment),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task CompleteAsync_ShouldThrowKeyNotFoundException_WhenAppointmentDoesNotExist()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            var act =
                async () => await _service.CompleteAsync(1);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>();
        }

        [Theory]
        [InlineData(AppointmentStatus.Pending)]
        [InlineData(AppointmentStatus.Completed)]
        [InlineData(AppointmentStatus.Cancelled)]
        public async Task CompleteAsync_ShouldThrowInvalidOperationException_WhenAppointmentIsNotConfirmed(
            AppointmentStatus status)
        {
            var appointment =
                BuildAppointment(1, 10, 20, status);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var act =
                async () => await _service.CompleteAsync(1);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Only confirmed appointments can be completed.");
        }

        #endregion

        #region CancelAsync

        [Fact]
        public async Task CancelAsync_ShouldCancelAppointmentAndInvalidateCache()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Confirmed);

            appointment.ScheduledDate =
                DateOnly.FromDateTime(DateTime.Today.AddDays(5));

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            _appointmentRepositoryMock
                .Setup(repository => repository.UpdateAsync(appointment))
                .Returns(Task.CompletedTask);

            _appointmentRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);



            var dto = new CancelAppointmentDto
            {
                CancellationReason = "  Doctor unavailable  "
            };

            await _service.CancelAsync(1, dto);

            appointment.Status.Should().Be(AppointmentStatus.Cancelled);
            appointment.CancellationReason.Should().Be("Doctor unavailable");

        }

        [Fact]
        public async Task CancelAsync_ShouldThrowKeyNotFoundException_WhenAppointmentDoesNotExist()
        {
            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync((Appointment?)null);

            var act =
                async () => await _service.CancelAsync(
                    1,
                    new CancelAppointmentDto
                    {
                        CancellationReason = "Reason"
                    });

            await act.Should()
                .ThrowAsync<KeyNotFoundException>();
        }

        [Fact]
        public async Task CancelAsync_ShouldThrowInvalidOperationException_WhenAppointmentCompleted()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Completed);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var act =
                async () => await _service.CancelAsync(
                    1,
                    new CancelAppointmentDto
                    {
                        CancellationReason = "Reason"
                    });

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Completed appointments cannot be cancelled.");
        }

        [Fact]
        public async Task CancelAsync_ShouldThrowInvalidOperationException_WhenAppointmentAlreadyCancelled()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Cancelled);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var act =
                async () => await _service.CancelAsync(
                    1,
                    new CancelAppointmentDto
                    {
                        CancellationReason = "Reason"
                    });

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Appointment already cancelled.");
        }

        [Fact]
        public async Task CancelAsync_ShouldThrowArgumentException_WhenCancellationReasonIsMissing()
        {
            var appointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Pending);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetByIdAsync(1))
                .ReturnsAsync(appointment);

            var act =
                async () => await _service.CancelAsync(
                    1,
                    new CancelAppointmentDto
                    {
                        CancellationReason = "   "
                    });

            await act.Should()
                .ThrowAsync<ArgumentException>()
                .WithMessage("Cancellation reason is required.");
        }

        #endregion

        #region GetDoctorPatientsAsync

        [Fact]
        public async Task GetDoctorPatientsAsync_ShouldThrowKeyNotFoundException_WhenDoctorDoesNotExist()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(20))
                .ReturnsAsync((Doctor?)null);

            var act =
                async () => await _service.GetDoctorPatientsAsync(20);

            await act.Should()
                .ThrowAsync<KeyNotFoundException>()
                .WithMessage("Doctor with Id 20 not found.");

            _appointmentRepositoryMock.Verify(
                repository => repository.GetDoctorPatientAppointmentsAsync(It.IsAny<int>()),
                Times.Never);
        }

        [Fact]
        public async Task GetDoctorPatientsAsync_ShouldReturnGroupedPatientsOrderedByName()
        {
            var doctor =
                BuildDoctor(20);

            var patientA =
                BuildPatient(10);

            patientA.FullName = "Zara Patient";

            var patientB =
                BuildPatient(11);

            patientB.FullName = "Aaron Patient";

            var olderAppointment =
                BuildAppointment(1, 10, 20, AppointmentStatus.Completed);

            olderAppointment.Patient = patientA;
            olderAppointment.ScheduledDate = new DateOnly(2026, 7, 1);
            olderAppointment.TimeSlot = AppointmentTimeSlot.TenAM;

            var newerAppointment =
                BuildAppointment(2, 10, 20, AppointmentStatus.Completed);

            newerAppointment.Patient = patientA;
            newerAppointment.ScheduledDate = new DateOnly(2026, 7, 10);
            newerAppointment.TimeSlot = AppointmentTimeSlot.ElevenAM;

            var patientBAppointment =
                BuildAppointment(3, 11, 20, AppointmentStatus.Pending);

            patientBAppointment.Patient = patientB;
            patientBAppointment.ScheduledDate = new DateOnly(2026, 7, 5);

            var nullPatientAppointment =
                BuildAppointment(4, 99, 20, AppointmentStatus.Pending);

            nullPatientAppointment.Patient = null!;

            var appointments = new List<Appointment>
            {
                olderAppointment,
                newerAppointment,
                patientBAppointment,
                nullPatientAppointment
            };

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(20))
                .ReturnsAsync(doctor);

            _appointmentRepositoryMock
                .Setup(repository => repository.GetDoctorPatientAppointmentsAsync(20))
                .ReturnsAsync(appointments);

            var result =
                (await _service.GetDoctorPatientsAsync(20)).ToList();

            result.Should().HaveCount(2);

            result[0].PatientId.Should().Be(11);
            result[0].FullName.Should().Be("Aaron Patient");
            result[0].TotalAppointments.Should().Be(1);
            result[0].LastVisitDate.Should().Be(new DateOnly(2026, 7, 5));

            result[1].PatientId.Should().Be(10);
            result[1].FullName.Should().Be("Zara Patient");
            result[1].TotalAppointments.Should().Be(2);
            result[1].LastVisitDate.Should().Be(new DateOnly(2026, 7, 10));

            _doctorRepositoryMock.Verify(
                repository => repository.GetByIdAsync(20),
                Times.Once);

            _appointmentRepositoryMock.Verify(
                repository => repository.GetDoctorPatientAppointmentsAsync(20),
                Times.Once);
        }

        [Fact]
        public async Task GetDoctorPatientsAsync_ShouldReturnEmptyCollection_WhenDoctorHasNoPatientAppointments()
        {
            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(20))
                .ReturnsAsync(BuildDoctor(20));

            _appointmentRepositoryMock
                .Setup(repository => repository.GetDoctorPatientAppointmentsAsync(20))
                .ReturnsAsync(new List<Appointment>());

            var result =
                (await _service.GetDoctorPatientsAsync(20)).ToList();

            result.Should().BeEmpty();
        }

        #endregion

        #region Helpers

        private static CreateAppointmentDto BuildValidCreateAppointmentDto()
        {
            return new CreateAppointmentDto
            {
                PatientId = 10,
                DoctorId = 20,
                ScheduledDate = DateOnly.FromDateTime(DateTime.Today.AddDays(2)),
                TimeSlot = (int)AppointmentTimeSlot.TenAM
            };
        }

        private static UpdateAppointmentDto BuildValidUpdateAppointmentDto()
        {
            return new UpdateAppointmentDto
            {
                DoctorId = 20,
                ScheduledDate = DateOnly.FromDateTime(DateTime.Today.AddDays(3)),
                TimeSlot = (int)AppointmentTimeSlot.ElevenAM
            };
        }

        private void SetupPatientAndDoctor(
            CreateAppointmentDto dto)
        {
            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.PatientId))
                .ReturnsAsync(BuildPatient(dto.PatientId));

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync(BuildDoctor(dto.DoctorId));
        }

        private void SetupSuccessfulBookingValidation(
            CreateAppointmentDto dto)
        {
            SetupPatientAndDoctor(dto);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameDoctorSameDateAsync(
                    dto.PatientId,
                    dto.DoctorId,
                    dto.ScheduledDate))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameSlotSameDateAsync(
                    dto.PatientId,
                    dto.ScheduledDate,
                    dto.TimeSlot))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSameDoctorSameSlotSameDateAsync(
                    dto.DoctorId,
                    dto.ScheduledDate,
                    dto.TimeSlot))
                .ReturnsAsync(false);
        }

        private void SetupSuccessfulUpdateBookingValidation(
            int appointmentId,
            int patientId,
            UpdateAppointmentDto dto)
        {
            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(BuildPatient(patientId));

            _doctorRepositoryMock
                .Setup(repository => repository.GetByIdAsync(dto.DoctorId))
                .ReturnsAsync(BuildDoctor(dto.DoctorId));

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameDoctorSameDateAsync(
                    patientId,
                    dto.DoctorId,
                    dto.ScheduledDate,
                    appointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSamePatientSameSlotSameDateAsync(
                    patientId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    appointmentId))
                .ReturnsAsync(false);

            _appointmentRepositoryMock
                .Setup(repository => repository.ExistsSameDoctorSameSlotSameDateAsync(
                    dto.DoctorId,
                    dto.ScheduledDate,
                    dto.TimeSlot,
                    appointmentId))
                .ReturnsAsync(false);
        }

        private static Patient BuildPatient(
            int patientId,
            bool isActive = true)
        {
            return new Patient
            {
                PatientId = patientId,
                FullName = $"Patient {patientId}",
                DateOfBirth = DateOnly.FromDateTime(DateTime.Today.AddYears(-30)),
                Gender = Gender.Male,
                PhoneNumber = "9999999999",
                Email = $"patient{patientId}@healthaxis.com",
                InsuranceNumber = $"INS{patientId}",
                IsActive = isActive
            };
        }

        private static Doctor BuildDoctor(
            int doctorId,
            bool isActive = true)
        {
            return new Doctor
            {
                DoctorId = doctorId,
                FullName = $"Doctor {doctorId}",
                Email = $"doctor{doctorId}@healthaxis.com",
                Specialisation = DoctorSpecialisation.Cardiologist,
                YearsOfExperience = 10,
                ConsultationFee = 500,
                IsActive = isActive
            };
        }

        private static Appointment BuildAppointment(
            int appointmentId,
            int patientId,
            int doctorId,
            AppointmentStatus status)
        {
            var patient =
                BuildPatient(patientId);

            var doctor =
                BuildDoctor(doctorId);

            return new Appointment
            {
                AppointmentId = appointmentId,
                PatientId = patientId,
                Patient = patient,
                DoctorId = doctorId,
                Doctor = doctor,
                ScheduledDate = DateOnly.FromDateTime(DateTime.Today.AddDays(2)),
                TimeSlot = AppointmentTimeSlot.TenAM,
                Status = status
            };
        }

        private static string BuildExpectedCacheKey(
            int doctorId,
            DateOnly date)
        {
            return $"doctors:{doctorId}:availability:{date:yyyy-MM-dd}";
        }

        #endregion
    }
}
