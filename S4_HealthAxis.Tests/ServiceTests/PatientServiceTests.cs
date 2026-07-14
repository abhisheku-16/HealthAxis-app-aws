using Moq;
using S4_HealthAxis.Shared.DTOs.Patient;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using Xunit;

namespace S4_HealthAxis.Tests.ServiceTests
{
    public class PatientServiceTests
    {
        private readonly Mock<IPatientRepository> _patientRepositoryMock;
        private readonly PatientService _patientService;

        public PatientServiceTests()
        {
            _patientRepositoryMock =
                new Mock<IPatientRepository>(MockBehavior.Strict);

            _patientService =
                new PatientService(_patientRepositoryMock.Object);
        }

        #region GetAllAsync

        [Fact]
        public async Task GetAllAsync_WhenPatientsExist_ReturnsMappedPatients()
        {
            var patients = new List<Patient>
            {
                CreatePatient(1, "Ayush Sharma", true),
                CreatePatient(2, "Riya Shukla", false)
            };

            _patientRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(patients);

            var result =
                (await _patientService.GetAllAsync()).ToList();

            Assert.Equal(2, result.Count);

            Assert.Equal(1, result[0].PatientId);
            Assert.Equal("Ayush Sharma", result[0].FullName);
            Assert.True(result[0].IsActive);

            Assert.Equal(2, result[1].PatientId);
            Assert.Equal("Riya Shukla", result[1].FullName);
            Assert.False(result[1].IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAllAsync_MapsAllPatientProperties()
        {
            var patient = new Patient
            {
                PatientId = 10,
                FullName = "Complete Patient",
                DateOfBirth = new DateOnly(1995, 5, 10),
                Gender = Gender.Male,
                PhoneNumber = "+91 9876543210",
                Email = "complete@example.com",
                InsuranceNumber = "INS-100",
                IsActive = true
            };

            _patientRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(new List<Patient> { patient });

            var result =
                (await _patientService.GetAllAsync()).Single();

            Assert.Equal(patient.PatientId, result.PatientId);
            Assert.Equal(patient.FullName, result.FullName);
            Assert.Equal(patient.DateOfBirth, result.DateOfBirth);
            Assert.Equal(patient.Gender, result.Gender);
            Assert.Equal(patient.PhoneNumber, result.PhoneNumber);
            Assert.Equal(patient.Email, result.Email);
            Assert.Equal(patient.InsuranceNumber, result.InsuranceId);
            Assert.Equal(patient.IsActive, result.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAllAsync_WhenNoPatientsExist_ReturnsEmptyCollection()
        {
            _patientRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(new List<Patient>());

            var result =
                (await _patientService.GetAllAsync()).ToList();

            Assert.NotNull(result);
            Assert.Empty(result);

            _patientRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAllAsync_PreservesRepositoryOrder()
        {
            var patients = new List<Patient>
            {
                CreatePatient(3, "Third Patient", true),
                CreatePatient(1, "First Patient", true),
                CreatePatient(2, "Second Patient", true)
            };

            _patientRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ReturnsAsync(patients);

            var result =
                (await _patientService.GetAllAsync()).ToList();

            Assert.Equal(
                new[] { 3, 1, 2 },
                result.Select(patient => patient.PatientId));

            _patientRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetAllAsync_WhenRepositoryThrows_PropagatesException()
        {
            const string errorMessage =
                "Unable to retrieve patients.";

            _patientRepositoryMock
                .Setup(repository => repository.GetAllAsync())
                .ThrowsAsync(new InvalidOperationException(errorMessage));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.GetAllAsync());

            Assert.Equal(errorMessage, exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetAllAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region GetByIdAsync

        [Fact]
        public async Task GetByIdAsync_WhenPatientExists_ReturnsMappedPatient()
        {
            const int patientId = 5;

            var patient =
                CreatePatient(patientId, "Existing Patient", true);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            var result =
                await _patientService.GetByIdAsync(patientId);

            Assert.NotNull(result);
            Assert.Equal(patient.PatientId, result.PatientId);
            Assert.Equal(patient.FullName, result.FullName);
            Assert.Equal(patient.DateOfBirth, result.DateOfBirth);
            Assert.Equal(patient.Gender, result.Gender);
            Assert.Equal(patient.PhoneNumber, result.PhoneNumber);
            Assert.Equal(patient.Email, result.Email);
            Assert.Equal(patient.InsuranceNumber, result.InsuranceId);
            Assert.Equal(patient.IsActive, result.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetByIdAsync_WhenPatientDoesNotExist_ReturnsNull()
        {
            const int patientId = 999;

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync((Patient?)null);

            var result =
                await _patientService.GetByIdAsync(patientId);

            Assert.Null(result);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData(0)]
        [InlineData(1)]
        [InlineData(500)]
        [InlineData(int.MaxValue)]
        public async Task GetByIdAsync_ForwardsProvidedIdentifier(int patientId)
        {
            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync((Patient?)null);

            await _patientService.GetByIdAsync(patientId);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task GetByIdAsync_WhenRepositoryThrows_PropagatesException()
        {
            const int patientId = 5;
            const string errorMessage = "Patient lookup failed.";

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ThrowsAsync(new InvalidOperationException(errorMessage));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.GetByIdAsync(patientId));

            Assert.Equal(errorMessage, exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region SearchByNameAsync

        [Fact]
        public async Task SearchByNameAsync_WhenMatchesExist_ReturnsMappedResults()
        {
            const string searchName = "ayu";

            var patients = new List<Patient>
            {
                CreatePatient(1, "Ayush Sharma", true),
                CreatePatient(2, "Ayushi Srivastava", false)
            };

            _patientRepositoryMock
                .Setup(repository => repository.SearchByNameAsync(searchName))
                .ReturnsAsync(patients);

            var result =
                (await _patientService.SearchByNameAsync(searchName))
                .ToList();

            Assert.Equal(2, result.Count);

            Assert.Equal(1, result[0].PatientId);
            Assert.Equal("Ayush Sharma", result[0].FullName);
            Assert.True(result[0].IsActive);

            Assert.Equal(2, result[1].PatientId);
            Assert.Equal("Ayushi Srivastava", result[1].FullName);
            Assert.False(result[1].IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.SearchByNameAsync(searchName),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task SearchByNameAsync_WhenNoMatchesExist_ReturnsEmptyCollection()
        {
            const string searchName = "missing";

            _patientRepositoryMock
                .Setup(repository => repository.SearchByNameAsync(searchName))
                .ReturnsAsync(new List<Patient>());

            var result =
                (await _patientService.SearchByNameAsync(searchName))
                .ToList();

            Assert.Empty(result);

            _patientRepositoryMock.Verify(
                repository => repository.SearchByNameAsync(searchName),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData("Ayush")]
        [InlineData("  Ayush  ")]
        [InlineData("")]
        [InlineData("A")]
        [InlineData("UPPERCASE")]
        public async Task SearchByNameAsync_ForwardsSearchTextWithoutChangingIt(
            string searchName)
        {
            _patientRepositoryMock
                .Setup(repository => repository.SearchByNameAsync(searchName))
                .ReturnsAsync(new List<Patient>());

            await _patientService.SearchByNameAsync(searchName);

            _patientRepositoryMock.Verify(
                repository => repository.SearchByNameAsync(searchName),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task SearchByNameAsync_WhenRepositoryThrows_PropagatesException()
        {
            const string searchName = "Ayush";
            const string errorMessage = "Patient search failed.";

            _patientRepositoryMock
                .Setup(repository => repository.SearchByNameAsync(searchName))
                .ThrowsAsync(new InvalidOperationException(errorMessage));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.SearchByNameAsync(searchName));

            Assert.Equal(errorMessage, exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.SearchByNameAsync(searchName),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region CreateAsync Success

        [Fact]
        public async Task CreateAsync_WithValidDto_AddsSavesAndReturnsPatient()
        {
            var dto = CreateValidCreateDto();

            Patient? addedPatient = null;

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Callback<Patient>(patient =>
                {
                    addedPatient = patient;
                    patient.PatientId = 25;
                })
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result =
                await _patientService.CreateAsync(dto);

            Assert.NotNull(addedPatient);

            Assert.Equal(25, result.PatientId);
            Assert.Equal(dto.FullName, result.FullName);
            Assert.Equal(dto.DateOfBirth, result.DateOfBirth);
            Assert.Equal(dto.Gender, result.Gender);
            Assert.Equal(dto.PhoneNumber, result.PhoneNumber);
            Assert.Equal(dto.Email, result.Email);
            Assert.Equal(dto.InsuranceNumber, result.InsuranceId);
            Assert.True(result.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_TrimsAllSupportedStringValues()
        {
            var dto = CreateValidCreateDto();

            dto.FullName = "  Ayush Sharma  ";
            dto.PhoneNumber = "  +91 9876543210  ";
            dto.Email = "  ayush@example.com  ";
            dto.InsuranceNumber = "  INS-1001  ";

            Patient? addedPatient = null;

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Callback<Patient>(patient => addedPatient = patient)
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result =
                await _patientService.CreateAsync(dto);

            Assert.NotNull(addedPatient);

            Assert.Equal("Ayush Sharma", addedPatient.FullName);
            Assert.Equal("+91 9876543210", addedPatient.PhoneNumber);
            Assert.Equal("ayush@example.com", addedPatient.Email);
            Assert.Equal("INS-1001", addedPatient.InsuranceNumber);

            Assert.Equal("Ayush Sharma", result.FullName);
            Assert.Equal("+91 9876543210", result.PhoneNumber);
            Assert.Equal("ayush@example.com", result.Email);
            Assert.Equal("INS-1001", result.InsuranceId);

            _patientRepositoryMock.Verify(
                repository =>
                    repository.AddAsync(
                        It.Is<Patient>(patient =>
                            patient.FullName == "Ayush Sharma" &&
                            patient.PhoneNumber == "+91 9876543210" &&
                            patient.Email == "ayush@example.com" &&
                            patient.InsuranceNumber == "INS-1001")),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenEmailIsNull_StoresEmptyString()
        {
            var dto = CreateValidCreateDto();
            dto.Email = null;

            Patient? addedPatient = null;

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Callback<Patient>(patient => addedPatient = patient)
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result =
                await _patientService.CreateAsync(dto);

            Assert.NotNull(addedPatient);
            Assert.Equal(string.Empty, addedPatient.Email);
            Assert.Equal(string.Empty, result.Email);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenInsuranceNumberIsNull_PreservesNull()
        {
            var dto = CreateValidCreateDto();
            dto.InsuranceNumber = null;

            Patient? addedPatient = null;

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Callback<Patient>(patient => addedPatient = patient)
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result =
                await _patientService.CreateAsync(dto);

            Assert.NotNull(addedPatient);
            Assert.Null(addedPatient.InsuranceNumber);
            Assert.Null(result.InsuranceId);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_AlwaysCreatesActivePatient()
        {
            var dto = CreateValidCreateDto();

            _patientRepositoryMock
                .Setup(repository =>
                    repository.AddAsync(
                        It.Is<Patient>(patient => patient.IsActive)))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result =
                await _patientService.CreateAsync(dto);

            Assert.True(result.IsActive);

            _patientRepositoryMock.Verify(
                repository =>
                    repository.AddAsync(
                        It.Is<Patient>(patient => patient.IsActive)),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenDateOfBirthIsToday_Succeeds()
        {
            var dto = CreateValidCreateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today);

            SetupSuccessfulCreate();

            var result =
                await _patientService.CreateAsync(dto);

            Assert.Equal(dto.DateOfBirth, result.DateOfBirth);

            VerifySuccessfulCreateCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenDateOfBirthIsExactlyOneHundredTwentyYearsAgo_Succeeds()
        {
            var dto = CreateValidCreateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddYears(-120));

            SetupSuccessfulCreate();

            var result =
                await _patientService.CreateAsync(dto);

            Assert.Equal(dto.DateOfBirth, result.DateOfBirth);

            VerifySuccessfulCreateCalls();
        }

        #endregion

        #region CreateAsync Validation

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task CreateAsync_WhenNameIsMissing_ThrowsArgumentException(
            string fullName)
        {
            var dto = CreateValidCreateDto();
            dto.FullName = fullName;

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal("Patient name is required.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenDateOfBirthIsInFuture_ThrowsArgumentException()
        {
            var dto = CreateValidCreateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddDays(1));

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal(
                "Date of birth cannot be in the future.",
                exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenDateOfBirthIsOlderThanOneHundredTwentyYears_ThrowsArgumentException()
        {
            var dto = CreateValidCreateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddYears(-120))
                    .AddDays(-1);

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal("Invalid date of birth.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task CreateAsync_WhenPhoneNumberIsMissing_ThrowsArgumentException(
            string phoneNumber)
        {
            var dto = CreateValidCreateDto();
            dto.PhoneNumber = phoneNumber;

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal("Phone number is required.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenMultipleFieldsAreInvalid_ValidatesNameFirst()
        {
            var dto = CreateValidCreateDto();

            dto.FullName = string.Empty;
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddDays(1));
            dto.PhoneNumber = string.Empty;

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal("Patient name is required.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenAddFails_DoesNotSaveChanges()
        {
            var dto = CreateValidCreateDto();

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .ThrowsAsync(
                    new InvalidOperationException("Unable to add patient."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal("Unable to add patient.", exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task CreateAsync_WhenSaveFails_PropagatesException()
        {
            var dto = CreateValidCreateDto();

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(
                    new InvalidOperationException("Unable to save patient."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.CreateAsync(dto));

            Assert.Equal("Unable to save patient.", exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region UpdateAsync Success

        [Fact]
        public async Task UpdateAsync_WhenPatientExists_UpdatesEverySupportedProperty()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", false);

            var dto = CreateValidUpdateDto();

            dto.FullName = "Updated Patient";
            dto.DateOfBirth = new DateOnly(1999, 4, 20);
            dto.Gender = Gender.Female;
            dto.PhoneNumber = "+44 9876543210";
            dto.Email = "updated@example.com";
            dto.InsuranceNumber = "UPDATED-INS";

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.Equal(dto.FullName, existingPatient.FullName);
            Assert.Equal(dto.DateOfBirth, existingPatient.DateOfBirth);
            Assert.Equal(dto.Gender, existingPatient.Gender);
            Assert.Equal(dto.PhoneNumber, existingPatient.PhoneNumber);
            Assert.Equal(dto.Email, existingPatient.Email);
            Assert.Equal(dto.InsuranceNumber, existingPatient.InsuranceNumber);
            Assert.False(existingPatient.IsActive);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        [Fact]
        public async Task UpdateAsync_TrimsAllSupportedStringValues()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", true);

            var dto = CreateValidUpdateDto();

            dto.FullName = "  Updated Patient  ";
            dto.PhoneNumber = "  +81 9876543210  ";
            dto.Email = "  updated@example.com  ";
            dto.InsuranceNumber = "  INS-UPDATED  ";

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.Equal("Updated Patient", existingPatient.FullName);
            Assert.Equal("+81 9876543210", existingPatient.PhoneNumber);
            Assert.Equal("updated@example.com", existingPatient.Email);
            Assert.Equal("INS-UPDATED", existingPatient.InsuranceNumber);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        [Fact]
        public async Task UpdateAsync_WhenEmailIsNull_SetsEmailToEmptyString()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", true);

            existingPatient.Email = "old@example.com";

            var dto = CreateValidUpdateDto();
            dto.Email = null;

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.Equal(string.Empty, existingPatient.Email);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        [Fact]
        public async Task UpdateAsync_WhenInsuranceNumberIsNull_SetsInsuranceNumberToNull()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", true);

            existingPatient.InsuranceNumber = "OLD-INS";

            var dto = CreateValidUpdateDto();
            dto.InsuranceNumber = null;

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.Null(existingPatient.InsuranceNumber);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        [Fact]
        public async Task UpdateAsync_DoesNotChangeExistingActiveStatus()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", false);

            var dto = CreateValidUpdateDto();

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.False(existingPatient.IsActive);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        [Fact]
        public async Task UpdateAsync_WhenDateOfBirthIsToday_Succeeds()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", true);

            var dto = CreateValidUpdateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today);

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.Equal(dto.DateOfBirth, existingPatient.DateOfBirth);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        [Fact]
        public async Task UpdateAsync_WhenDateOfBirthIsExactlyOneHundredTwentyYearsAgo_Succeeds()
        {
            const int patientId = 7;

            var existingPatient =
                CreatePatient(patientId, "Old Name", true);

            var dto = CreateValidUpdateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddYears(-120));

            SetupSuccessfulUpdate(patientId, existingPatient);

            await _patientService.UpdateAsync(patientId, dto);

            Assert.Equal(dto.DateOfBirth, existingPatient.DateOfBirth);

            VerifySuccessfulUpdateCalls(patientId, existingPatient);
        }

        #endregion

        #region UpdateAsync Validation And Failure

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task UpdateAsync_WhenNameIsMissing_ThrowsBeforeRepositoryLookup(
            string fullName)
        {
            var dto = CreateValidUpdateDto();
            dto.FullName = fullName;

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.UpdateAsync(10, dto));

            Assert.Equal("Patient name is required.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_WhenDateOfBirthIsInFuture_ThrowsBeforeRepositoryLookup()
        {
            var dto = CreateValidUpdateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddDays(1));

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.UpdateAsync(10, dto));

            Assert.Equal(
                "Date of birth cannot be in the future.",
                exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_WhenDateOfBirthIsOlderThanOneHundredTwentyYears_ThrowsBeforeRepositoryLookup()
        {
            var dto = CreateValidUpdateDto();
            dto.DateOfBirth =
                DateOnly.FromDateTime(DateTime.Today.AddYears(-120))
                    .AddDays(-1);

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.UpdateAsync(10, dto));

            Assert.Equal("Invalid date of birth.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Theory]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task UpdateAsync_WhenPhoneNumberIsMissing_ThrowsBeforeRepositoryLookup(
            string phoneNumber)
        {
            var dto = CreateValidUpdateDto();
            dto.PhoneNumber = phoneNumber;

            var exception =
                await Assert.ThrowsAsync<ArgumentException>(
                    () => _patientService.UpdateAsync(10, dto));

            Assert.Equal("Phone number is required.", exception.Message);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_WhenPatientDoesNotExist_ThrowsKeyNotFoundException()
        {
            const int patientId = 404;

            var dto = CreateValidUpdateDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync((Patient?)null);

            var exception =
                await Assert.ThrowsAsync<KeyNotFoundException>(
                    () => _patientService.UpdateAsync(patientId, dto));

            Assert.Equal(
                $"Patient with Id {patientId} not found.",
                exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<Patient>()),
                Times.Never);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_WhenLookupFails_PropagatesException()
        {
            const int patientId = 7;
            const string errorMessage = "Patient lookup failed.";

            var dto = CreateValidUpdateDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ThrowsAsync(new InvalidOperationException(errorMessage));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.UpdateAsync(patientId, dto));

            Assert.Equal(errorMessage, exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_WhenRepositoryUpdateFails_DoesNotSaveChanges()
        {
            const int patientId = 7;

            var patient =
                CreatePatient(patientId, "Existing Patient", true);

            var dto = CreateValidUpdateDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .ThrowsAsync(
                    new InvalidOperationException("Unable to update patient."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.UpdateAsync(patientId, dto));

            Assert.Equal("Unable to update patient.", exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task UpdateAsync_WhenSaveFails_PropagatesException()
        {
            const int patientId = 7;

            var patient =
                CreatePatient(patientId, "Existing Patient", true);

            var dto = CreateValidUpdateDto();

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(
                    new InvalidOperationException(
                        "Unable to save patient update."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.UpdateAsync(patientId, dto));

            Assert.Equal(
                "Unable to save patient update.",
                exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region DeactivateAsync

        [Fact]
        public async Task DeactivateAsync_WhenPatientIsActive_DeactivatesAndSaves()
        {
            const int patientId = 8;

            var patient =
                CreatePatient(patientId, "Active Patient", true);

            SetupSuccessfulStatusUpdate(patientId, patient);

            await _patientService.DeactivateAsync(patientId);

            Assert.False(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository =>
                    repository.UpdateAsync(
                        It.Is<Patient>(value =>
                            ReferenceEquals(value, patient) &&
                            !value.IsActive)),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task DeactivateAsync_WhenPatientAlreadyInactive_StillUpdatesAndSaves()
        {
            const int patientId = 8;

            var patient =
                CreatePatient(patientId, "Inactive Patient", false);

            SetupSuccessfulStatusUpdate(patientId, patient);

            await _patientService.DeactivateAsync(patientId);

            Assert.False(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task DeactivateAsync_WhenPatientDoesNotExist_ThrowsKeyNotFoundException()
        {
            const int patientId = 404;

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync((Patient?)null);

            var exception =
                await Assert.ThrowsAsync<KeyNotFoundException>(
                    () => _patientService.DeactivateAsync(patientId));

            Assert.Equal(
                $"Patient with Id {patientId} not found.",
                exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task DeactivateAsync_WhenUpdateFails_DoesNotSave()
        {
            const int patientId = 8;

            var patient =
                CreatePatient(patientId, "Patient", true);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .ThrowsAsync(
                    new InvalidOperationException("Deactivation failed."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.DeactivateAsync(patientId));

            Assert.Equal("Deactivation failed.", exception.Message);
            Assert.False(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task DeactivateAsync_WhenSaveFails_PropagatesException()
        {
            const int patientId = 8;

            var patient =
                CreatePatient(patientId, "Patient", true);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(
                    new InvalidOperationException(
                        "Deactivation save failed."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.DeactivateAsync(patientId));

            Assert.Equal("Deactivation save failed.", exception.Message);
            Assert.False(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region ActivateAsync

        [Fact]
        public async Task ActivateAsync_WhenPatientIsInactive_ActivatesAndSaves()
        {
            const int patientId = 9;

            var patient =
                CreatePatient(patientId, "Inactive Patient", false);

            SetupSuccessfulStatusUpdate(patientId, patient);

            await _patientService.ActivateAsync(patientId);

            Assert.True(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository =>
                    repository.UpdateAsync(
                        It.Is<Patient>(value =>
                            ReferenceEquals(value, patient) &&
                            value.IsActive)),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task ActivateAsync_WhenPatientAlreadyActive_StillUpdatesAndSaves()
        {
            const int patientId = 9;

            var patient =
                CreatePatient(patientId, "Active Patient", true);

            SetupSuccessfulStatusUpdate(patientId, patient);

            await _patientService.ActivateAsync(patientId);

            Assert.True(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task ActivateAsync_WhenPatientDoesNotExist_ThrowsKeyNotFoundException()
        {
            const int patientId = 404;

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync((Patient?)null);

            var exception =
                await Assert.ThrowsAsync<KeyNotFoundException>(
                    () => _patientService.ActivateAsync(patientId));

            Assert.Equal(
                $"Patient with Id {patientId} not found.",
                exception.Message);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task ActivateAsync_WhenUpdateFails_DoesNotSave()
        {
            const int patientId = 9;

            var patient =
                CreatePatient(patientId, "Patient", false);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .ThrowsAsync(
                    new InvalidOperationException("Activation failed."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.ActivateAsync(patientId));

            Assert.Equal("Activation failed.", exception.Message);
            Assert.True(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        [Fact]
        public async Task ActivateAsync_WhenSaveFails_PropagatesException()
        {
            const int patientId = 9;

            var patient =
                CreatePatient(patientId, "Patient", false);

            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(
                    new InvalidOperationException(
                        "Activation save failed."));

            var exception =
                await Assert.ThrowsAsync<InvalidOperationException>(
                    () => _patientService.ActivateAsync(patientId));

            Assert.Equal("Activation save failed.", exception.Message);
            Assert.True(patient.IsActive);

            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        #endregion

        #region Helpers

        private static Patient CreatePatient(
            int patientId,
            string fullName,
            bool isActive)
        {
            return new Patient
            {
                PatientId = patientId,
                FullName = fullName,
                DateOfBirth = new DateOnly(1995, 5, 10),
                Gender = Gender.Male,
                PhoneNumber = "+91 9876543210",
                Email = $"patient{patientId}@example.com",
                InsuranceNumber = $"INS-{patientId}",
                IsActive = isActive
            };
        }

        private static CreatePatientDto CreateValidCreateDto()
        {
            return new CreatePatientDto
            {
                FullName = "Valid Patient",
                DateOfBirth = new DateOnly(1995, 5, 10),
                Gender = Gender.Male,
                PhoneNumber = "+91 9876543210",
                Email = "valid.patient@example.com",
                InsuranceNumber = "INS-1001"
            };
        }

        private static UpdatePatientDto CreateValidUpdateDto()
        {
            return new UpdatePatientDto
            {
                FullName = "Updated Patient",
                DateOfBirth = new DateOnly(1990, 8, 15),
                Gender = Gender.Female,
                PhoneNumber = "+91 9999999999",
                Email = "updated.patient@example.com",
                InsuranceNumber = "INS-UPDATED"
            };
        }

        private void SetupSuccessfulCreate()
        {
            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);
        }

        private void VerifySuccessfulCreateCalls()
        {
            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        private void SetupSuccessfulUpdate(
            int patientId,
            Patient patient)
        {
            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);
        }

        private void VerifySuccessfulUpdateCalls(
            int patientId,
            Patient patient)
        {
            _patientRepositoryMock.Verify(
                repository => repository.GetByIdAsync(patientId),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.UpdateAsync(patient),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _patientRepositoryMock.VerifyNoOtherCalls();
        }

        private void SetupSuccessfulStatusUpdate(
            int patientId,
            Patient patient)
        {
            _patientRepositoryMock
                .Setup(repository => repository.GetByIdAsync(patientId))
                .ReturnsAsync(patient);

            _patientRepositoryMock
                .Setup(repository => repository.UpdateAsync(patient))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);
        }

        #endregion
    }
}
