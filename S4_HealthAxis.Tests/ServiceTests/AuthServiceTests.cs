using FluentAssertions;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Moq;
using S4_HealthAxis.Shared.DTOs.Auth;
using S4_HealthAxis.Shared.Enums;
using S4_HealthAxisApi.Models;
using S4_HealthAxisApi.Repository.Interface;
using S4_HealthAxisApi.Services.Implementation;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Xunit;

namespace S4_HealthAxis.Tests.ServiceTests
{
    public class AuthServiceTests
    {
        private readonly Mock<IUserRepository> _userRepositoryMock;
        private readonly Mock<IPatientRepository> _patientRepositoryMock;
        private readonly Mock<IPasswordHasher<User>> _passwordHasherMock;
        private readonly IConfiguration _configuration;
        private readonly AuthService _service;

        public AuthServiceTests()
        {
            _userRepositoryMock = new Mock<IUserRepository>(MockBehavior.Strict);
            _patientRepositoryMock = new Mock<IPatientRepository>(MockBehavior.Strict);
            _passwordHasherMock = new Mock<IPasswordHasher<User>>(MockBehavior.Strict);

            _configuration = BuildConfiguration();

            _service = new AuthService(
                _userRepositoryMock.Object,
                _patientRepositoryMock.Object,
                _configuration,
                _passwordHasherMock.Object);
        }

        #region RegisterAsync

        [Fact]
        public async Task RegisterAsync_ShouldReturnFailure_WhenPasswordsDoNotMatch()
        {
            var request = BuildRegisterDto();
            request.Password = "Password@123";
            request.ConfirmPassword = "Different@123";

            var result = await _service.RegisterAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Passwords do not match.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.EmailExistsAsync(It.IsAny<string>()),
                Times.Never);

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RegisterAsync_ShouldReturnFailure_WhenEmailAlreadyExists()
        {
            var request = BuildRegisterDto();
            request.Email = "  Existing.User@HealthAxis.COM  ";

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync("existing.user@healthaxis.com"))
                .ReturnsAsync(true);

            var result = await _service.RegisterAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Email already exists.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.EmailExistsAsync("existing.user@healthaxis.com"),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Never);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task RegisterAsync_ShouldCreateUserAndReturnAuthResponse_WhenRequestIsValid()
        {
            var request = BuildRegisterDto();
            request.Email = "  New.User@HealthAxis.COM  ";
            request.Role = UserRole.Admin;

            User? capturedUser = null;

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync("new.user@healthaxis.com"))
                .ReturnsAsync(false);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), request.Password))
                .Returns("hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<User>()))
                .Callback<User>(user =>
                {
                    capturedUser = user;
                    user.UserId = 101;
                })
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.RegisterAsync(request);

            result.Success.Should().BeTrue();
            result.Message.Should().Be("User registered successfully.");
            result.Data.Should().NotBeNull();

            capturedUser.Should().NotBeNull();
            capturedUser!.Email.Should().Be("new.user@healthaxis.com");
            capturedUser.Role.Should().Be(UserRole.Admin);
            capturedUser.PasswordHash.Should().Be("hashed-password");
            capturedUser.MustChangePassword.Should().BeFalse();
            capturedUser.CreatedDate.Should().BeCloseTo(DateTime.UtcNow, TimeSpan.FromSeconds(10));
            capturedUser.RefreshToken.Should().NotBeNullOrWhiteSpace();
            capturedUser.RefreshTokenExpiryTime.Should().NotBeNull();
            capturedUser.RefreshTokenExpiryTime!.Value.Should().BeAfter(DateTime.UtcNow.AddDays(6));

            result.Data!.Email.Should().Be("new.user@healthaxis.com");
            result.Data.Role.Should().Be(UserRole.Admin.ToString());
            result.Data.AccessToken.Should().NotBeNullOrWhiteSpace();
            result.Data.RefreshToken.Should().Be(capturedUser.RefreshToken);
            result.Data.ReferenceId.Should().Be(capturedUser.ReferenceId);
            result.Data.MustChangePassword.Should().BeFalse();

            var claims = ReadClaims(result.Data.AccessToken);
            claims.Should().ContainKey(ClaimTypes.Role);
            claims[ClaimTypes.Role].Should().Be(UserRole.Admin.ToString());
            claims.Should().ContainKey(JwtRegisteredClaimNames.Email);
            claims[JwtRegisteredClaimNames.Email].Should().Be("new.user@healthaxis.com");

            _userRepositoryMock.Verify(
                repository => repository.EmailExistsAsync("new.user@healthaxis.com"),
                Times.Once);

            _passwordHasherMock.Verify(
                hasher => hasher.HashPassword(It.IsAny<User>(), request.Password),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task RegisterAsync_ShouldPropagateException_WhenEmailExistsCheckFails()
        {
            var request = BuildRegisterDto();

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync(request.Email.ToLower()))
                .ThrowsAsync(new InvalidOperationException("Email check failed."));

            var act = async () => await _service.RegisterAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Email check failed.");
        }

        [Fact]
        public async Task RegisterAsync_ShouldNotSave_WhenAddUserFails()
        {
            var request = BuildRegisterDto();

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync(request.Email.ToLower()))
                .ReturnsAsync(false);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), request.Password))
                .Returns("hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<User>()))
                .ThrowsAsync(new InvalidOperationException("User add failed."));

            var act = async () => await _service.RegisterAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("User add failed.");

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task RegisterAsync_ShouldPropagateException_WhenSaveFails()
        {
            var request = BuildRegisterDto();

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync(request.Email.ToLower()))
                .ReturnsAsync(false);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), request.Password))
                .Returns("hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<User>()))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("User save failed."));

            var act = async () => await _service.RegisterAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("User save failed.");
        }

        #endregion

        #region RegisterPatientAsync

        [Fact]
        public async Task RegisterPatientAsync_ShouldReturnFailure_WhenPasswordsDoNotMatch()
        {
            var request = BuildRegisterPatientDto();
            request.Password = "Password@123";
            request.ConfirmPassword = "Different@123";

            var result = await _service.RegisterPatientAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Passwords do not match.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.EmailExistsAsync(It.IsAny<string>()),
                Times.Never);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Never);
        }

        [Fact]
        public async Task RegisterPatientAsync_ShouldReturnFailure_WhenEmailAlreadyExists()
        {
            var request = BuildRegisterPatientDto();
            request.Email = "  Patient.User@HealthAxis.COM  ";

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync("patient.user@healthaxis.com"))
                .ReturnsAsync(true);

            var result = await _service.RegisterPatientAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Email already exists.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.EmailExistsAsync("patient.user@healthaxis.com"),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Never);

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RegisterPatientAsync_ShouldCreatePatientAndUser_WhenRequestIsValid()
        {
            var request = BuildRegisterPatientDto();
            request.FullName = "  Patient One  ";
            request.Email = "  New.Patient@HealthAxis.COM  ";
            request.PhoneNumber = "  9876543210  ";

            Patient? capturedPatient = null;
            User? capturedUser = null;

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync("new.patient@healthaxis.com"))
                .ReturnsAsync(false);

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Callback<Patient>(patient =>
                {
                    capturedPatient = patient;
                    patient.PatientId = 501;
                })
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), request.Password))
                .Returns("patient-hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<User>()))
                .Callback<User>(user =>
                {
                    capturedUser = user;
                    user.UserId = 601;
                })
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.RegisterPatientAsync(request);

            result.Success.Should().BeTrue();
            result.Message.Should().Be("Patient registered successfully.");
            result.Data.Should().NotBeNull();

            capturedPatient.Should().NotBeNull();
            capturedPatient!.PatientId.Should().Be(501);
            capturedPatient.FullName.Should().Be("Patient One");
            capturedPatient.Email.Should().Be("new.patient@healthaxis.com");
            capturedPatient.PhoneNumber.Should().Be("9876543210");
            capturedPatient.IsActive.Should().BeTrue();

            capturedUser.Should().NotBeNull();
            capturedUser!.Email.Should().Be("new.patient@healthaxis.com");
            capturedUser.Role.Should().Be(UserRole.Patient);
            capturedUser.ReferenceId.Should().Be(501);
            capturedUser.PasswordHash.Should().Be("patient-hashed-password");
            capturedUser.MustChangePassword.Should().BeFalse();
            capturedUser.RefreshToken.Should().NotBeNullOrWhiteSpace();
            capturedUser.RefreshTokenExpiryTime.Should().NotBeNull();

            result.Data!.Email.Should().Be("new.patient@healthaxis.com");
            result.Data.Role.Should().Be(UserRole.Patient.ToString());
            result.Data.ReferenceId.Should().Be(501);
            result.Data.AccessToken.Should().NotBeNullOrWhiteSpace();
            result.Data.RefreshToken.Should().Be(capturedUser.RefreshToken);

            _patientRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<Patient>()),
                Times.Once);

            _patientRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task RegisterPatientAsync_ShouldNotCreateUser_WhenPatientAddFails()
        {
            var request = BuildRegisterPatientDto();

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync(request.Email.ToLower()))
                .ReturnsAsync(false);

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .ThrowsAsync(new InvalidOperationException("Patient add failed."));

            var act = async () => await _service.RegisterPatientAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient add failed.");

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RegisterPatientAsync_ShouldNotCreateUser_WhenPatientSaveFails()
        {
            var request = BuildRegisterPatientDto();

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync(request.Email.ToLower()))
                .ReturnsAsync(false);

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Patient save failed."));

            var act = async () => await _service.RegisterPatientAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Patient save failed.");

            _userRepositoryMock.Verify(
                repository => repository.AddAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RegisterPatientAsync_ShouldPropagateException_WhenUserSaveFails()
        {
            var request = BuildRegisterPatientDto();

            _userRepositoryMock
                .Setup(repository => repository.EmailExistsAsync(request.Email.ToLower()))
                .ReturnsAsync(false);

            _patientRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<Patient>()))
                .Callback<Patient>(patient => patient.PatientId = 501)
                .Returns(Task.CompletedTask);

            _patientRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(It.IsAny<User>(), request.Password))
                .Returns("hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.AddAsync(It.IsAny<User>()))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("User save failed."));

            var act = async () => await _service.RegisterPatientAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("User save failed.");
        }

        #endregion

        #region LoginAsync

        [Fact]
        public async Task LoginAsync_ShouldReturnFailure_WhenUserDoesNotExist()
        {
            var request = new LoginDto
            {
                Email = "  Missing.User@HealthAxis.COM  ",
                Password = "Password@123"
            };

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("missing.user@healthaxis.com"))
                .ReturnsAsync((User?)null);

            var result = await _service.LoginAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Invalid email or password.");
            result.Data.Should().BeNull();

            _passwordHasherMock.Verify(
                hasher => hasher.VerifyHashedPassword(
                    It.IsAny<User>(),
                    It.IsAny<string>(),
                    It.IsAny<string>()),
                Times.Never);

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task LoginAsync_ShouldReturnFailure_WhenPasswordVerificationFails()
        {
            var request = new LoginDto
            {
                Email = "doctor@healthaxis.com",
                Password = "WrongPassword"
            };

            var user = BuildUser(10, "doctor@healthaxis.com", UserRole.Doctor, 3);

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("doctor@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(
                    user,
                    user.PasswordHash,
                    request.Password))
                .Returns(PasswordVerificationResult.Failed);

            var result = await _service.LoginAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Invalid email or password.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<User>()),
                Times.Never);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        [Theory]
        [InlineData(PasswordVerificationResult.Success)]
        [InlineData(PasswordVerificationResult.SuccessRehashNeeded)]
        public async Task LoginAsync_ShouldReturnAuthResponse_WhenPasswordVerificationSucceeds(
            PasswordVerificationResult verificationResult)
        {
            var request = new LoginDto
            {
                Email = "  Doctor@HealthAxis.COM  ",
                Password = "Password@123"
            };

            var user = BuildUser(10, "doctor@healthaxis.com", UserRole.Doctor, 3);
            user.MustChangePassword = true;

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("doctor@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(
                    user,
                    user.PasswordHash,
                    request.Password))
                .Returns(verificationResult);

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.LoginAsync(request);

            result.Success.Should().BeTrue();
            result.Message.Should().Be("Login successful.");
            result.Data.Should().NotBeNull();

            result.Data!.Email.Should().Be("doctor@healthaxis.com");
            result.Data.Role.Should().Be(UserRole.Doctor.ToString());
            result.Data.ReferenceId.Should().Be(3);
            result.Data.MustChangePassword.Should().BeTrue();
            result.Data.AccessToken.Should().NotBeNullOrWhiteSpace();
            result.Data.RefreshToken.Should().Be(user.RefreshToken);

            user.RefreshToken.Should().NotBeNullOrWhiteSpace();
            user.RefreshTokenExpiryTime.Should().NotBeNull();
            user.RefreshTokenExpiryTime!.Value.Should().BeAfter(DateTime.UtcNow.AddDays(6));

            var claims = ReadClaims(result.Data.AccessToken);
            claims[ClaimTypes.Role].Should().Be(UserRole.Doctor.ToString());
            claims["ReferenceId"].Should().Be("3");
            claims["MustChangePassword"].Should().Be("True");

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(user),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task LoginAsync_ShouldPropagateException_WhenLookupFails()
        {
            var request = new LoginDto
            {
                Email = "doctor@healthaxis.com",
                Password = "Password@123"
            };

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("doctor@healthaxis.com"))
                .ThrowsAsync(new InvalidOperationException("Login lookup failed."));

            var act = async () => await _service.LoginAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Login lookup failed.");
        }

        [Fact]
        public async Task LoginAsync_ShouldPropagateException_WhenUpdateFails()
        {
            var request = new LoginDto
            {
                Email = "doctor@healthaxis.com",
                Password = "Password@123"
            };

            var user = BuildUser(10, "doctor@healthaxis.com", UserRole.Doctor, 3);

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("doctor@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(
                    user,
                    user.PasswordHash,
                    request.Password))
                .Returns(PasswordVerificationResult.Success);

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .ThrowsAsync(new InvalidOperationException("Login update failed."));

            var act = async () => await _service.LoginAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Login update failed.");

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task LoginAsync_ShouldPropagateException_WhenSaveFails()
        {
            var request = new LoginDto
            {
                Email = "doctor@healthaxis.com",
                Password = "Password@123"
            };

            var user = BuildUser(10, "doctor@healthaxis.com", UserRole.Doctor, 3);

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("doctor@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(
                    user,
                    user.PasswordHash,
                    request.Password))
                .Returns(PasswordVerificationResult.Success);

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Login save failed."));

            var act = async () => await _service.LoginAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Login save failed.");
        }

        #endregion

        #region RefreshTokenAsync

        [Fact]
        public async Task RefreshTokenAsync_ShouldReturnFailure_WhenRefreshTokenIsInvalid()
        {
            var request = new RefreshTokenDto
            {
                RefreshToken = "invalid-token"
            };

            _userRepositoryMock
                .Setup(repository => repository.GetByRefreshTokenAsync(request.RefreshToken))
                .ReturnsAsync((User?)null);

            var result = await _service.RefreshTokenAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Invalid refresh token.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RefreshTokenAsync_ShouldReturnFailure_WhenRefreshTokenExpiryIsNull()
        {
            var request = new RefreshTokenDto
            {
                RefreshToken = "existing-refresh-token"
            };

            var user = BuildUser(1, "admin@healthaxis.com", UserRole.Admin, null);
            user.RefreshToken = request.RefreshToken;
            user.RefreshTokenExpiryTime = null;

            _userRepositoryMock
                .Setup(repository => repository.GetByRefreshTokenAsync(request.RefreshToken))
                .ReturnsAsync(user);

            var result = await _service.RefreshTokenAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Refresh token has expired.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RefreshTokenAsync_ShouldReturnFailure_WhenRefreshTokenIsExpired()
        {
            var request = new RefreshTokenDto
            {
                RefreshToken = "existing-refresh-token"
            };

            var user = BuildUser(1, "admin@healthaxis.com", UserRole.Admin, null);
            user.RefreshToken = request.RefreshToken;
            user.RefreshTokenExpiryTime = DateTime.UtcNow.AddMinutes(-1);

            _userRepositoryMock
                .Setup(repository => repository.GetByRefreshTokenAsync(request.RefreshToken))
                .ReturnsAsync(user);

            var result = await _service.RefreshTokenAsync(request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Refresh token has expired.");
            result.Data.Should().BeNull();

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Fact]
        public async Task RefreshTokenAsync_ShouldReturnNewTokens_WhenRefreshTokenIsValid()
        {
            var request = new RefreshTokenDto
            {
                RefreshToken = "existing-refresh-token"
            };

            var user = BuildUser(1, "admin@healthaxis.com", UserRole.Admin, null);
            user.RefreshToken = request.RefreshToken;
            user.RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(1);

            _userRepositoryMock
                .Setup(repository => repository.GetByRefreshTokenAsync(request.RefreshToken))
                .ReturnsAsync(user);

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.RefreshTokenAsync(request);

            result.Success.Should().BeTrue();
            result.Message.Should().Be("Token refreshed successfully.");
            result.Data.Should().NotBeNull();

            result.Data!.AccessToken.Should().NotBeNullOrWhiteSpace();
            result.Data.RefreshToken.Should().NotBe(request.RefreshToken);
            result.Data.RefreshToken.Should().Be(user.RefreshToken);
            result.Data.Email.Should().Be("admin@healthaxis.com");
            result.Data.Role.Should().Be(UserRole.Admin.ToString());

            user.RefreshTokenExpiryTime.Should().NotBeNull();
            user.RefreshTokenExpiryTime!.Value.Should().BeAfter(DateTime.UtcNow.AddDays(6));

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(user),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task RefreshTokenAsync_ShouldPropagateException_WhenLookupFails()
        {
            var request = new RefreshTokenDto
            {
                RefreshToken = "existing-refresh-token"
            };

            _userRepositoryMock
                .Setup(repository => repository.GetByRefreshTokenAsync(request.RefreshToken))
                .ThrowsAsync(new InvalidOperationException("Refresh lookup failed."));

            var act = async () => await _service.RefreshTokenAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Refresh lookup failed.");
        }

        [Fact]
        public async Task RefreshTokenAsync_ShouldPropagateException_WhenSaveFails()
        {
            var request = new RefreshTokenDto
            {
                RefreshToken = "existing-refresh-token"
            };

            var user = BuildUser(1, "admin@healthaxis.com", UserRole.Admin, null);
            user.RefreshToken = request.RefreshToken;
            user.RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(1);

            _userRepositoryMock
                .Setup(repository => repository.GetByRefreshTokenAsync(request.RefreshToken))
                .ReturnsAsync(user);

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Refresh save failed."));

            var act = async () => await _service.RefreshTokenAsync(request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Refresh save failed.");
        }

        #endregion

        #region ChangePasswordAsync Validation

        [Theory]
        [InlineData(null)]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenEmailIsInvalid(string? email)
        {
            var request = BuildValidChangePasswordDto();

            var result = await _service.ChangePasswordAsync(email!, request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Invalid authenticated user.");

            _userRepositoryMock.Verify(
                repository => repository.GetByEmailAsync(It.IsAny<string>()),
                Times.Never);
        }

        [Theory]
        [InlineData(null)]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenCurrentPasswordIsMissing(string? currentPassword)
        {
            var request = BuildValidChangePasswordDto();
            request.CurrentPassword = currentPassword!;

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Current password is required.");
        }

        [Theory]
        [InlineData(null)]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenNewPasswordIsMissing(string? newPassword)
        {
            var request = BuildValidChangePasswordDto();
            request.NewPassword = newPassword!;

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("New password is required.");
        }

        [Theory]
        [InlineData(null)]
        [InlineData("")]
        [InlineData(" ")]
        [InlineData("   ")]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenConfirmPasswordIsMissing(string? confirmPassword)
        {
            var request = BuildValidChangePasswordDto();
            request.ConfirmNewPassword = confirmPassword!;

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Confirm password is required.");
        }

        [Fact]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenNewAndConfirmPasswordsDoNotMatch()
        {
            var request = BuildValidChangePasswordDto();
            request.NewPassword = "NewPassword@123";
            request.ConfirmNewPassword = "Different@123";

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("New password and confirm password do not match.");
        }

        [Fact]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenNewPasswordEqualsCurrentPassword()
        {
            var request = BuildValidChangePasswordDto();
            request.CurrentPassword = "SamePassword@123";
            request.NewPassword = "SamePassword@123";
            request.ConfirmNewPassword = "SamePassword@123";

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("New password cannot be the same as current password.");
        }

        [Theory]
        [InlineData("Short1!", "Password must be at least 8 characters long.")]
        [InlineData("lowercase1!", "Password must contain at least one uppercase letter.")]
        [InlineData("UPPERCASE1!", "Password must contain at least one lowercase letter.")]
        [InlineData("NoNumber!", "Password must contain at least one number.")]
        [InlineData("NoSpecial1", "Password must contain at least one special character.")]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenPasswordStrengthIsInvalid(
            string newPassword,
            string expectedMessage)
        {
            var request = BuildValidChangePasswordDto();
            request.NewPassword = newPassword;
            request.ConfirmNewPassword = newPassword;

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be(expectedMessage);

            _userRepositoryMock.Verify(
                repository => repository.GetByEmailAsync(It.IsAny<string>()),
                Times.Never);
        }

        #endregion

        #region ChangePasswordAsync Success And Failure

        [Fact]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenUserDoesNotExist()
        {
            var request = BuildValidChangePasswordDto();

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("user@healthaxis.com"))
                .ReturnsAsync((User?)null);

            var result = await _service.ChangePasswordAsync("  User@HealthAxis.COM  ", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("User account not found.");

            _userRepositoryMock.Verify(
                repository => repository.GetByEmailAsync("user@healthaxis.com"),
                Times.Once);
        }

        [Fact]
        public async Task ChangePasswordAsync_ShouldReturnFailure_WhenCurrentPasswordIsIncorrect()
        {
            var request = BuildValidChangePasswordDto();

            var user = BuildUser(1, "user@healthaxis.com", UserRole.Doctor, 3);

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("user@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(
                    user,
                    user.PasswordHash,
                    request.CurrentPassword))
                .Returns(PasswordVerificationResult.Failed);

            var result = await _service.ChangePasswordAsync("user@healthaxis.com", request);

            result.Success.Should().BeFalse();
            result.Message.Should().Be("Current password is incorrect.");

            _passwordHasherMock.Verify(
                hasher => hasher.HashPassword(It.IsAny<User>(), It.IsAny<string>()),
                Times.Never);

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(It.IsAny<User>()),
                Times.Never);
        }

        [Theory]
        [InlineData(PasswordVerificationResult.Success)]
        [InlineData(PasswordVerificationResult.SuccessRehashNeeded)]
        public async Task ChangePasswordAsync_ShouldUpdatePassword_WhenRequestIsValid(
            PasswordVerificationResult verificationResult)
        {
            var request = BuildValidChangePasswordDto();

            var user = BuildUser(1, "user@healthaxis.com", UserRole.Doctor, 3);
            user.MustChangePassword = true;

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("user@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(
                    user,
                    user.PasswordHash,
                    request.CurrentPassword))
                .Returns(verificationResult);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(user, request.NewPassword))
                .Returns("new-hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .Returns(Task.CompletedTask);

            var result = await _service.ChangePasswordAsync("  User@HealthAxis.COM  ", request);

            result.Success.Should().BeTrue();
            result.Message.Should().Be("Password changed successfully.");

            user.PasswordHash.Should().Be("new-hashed-password");
            user.MustChangePassword.Should().BeFalse();

            _userRepositoryMock.Verify(
                repository => repository.GetByEmailAsync("user@healthaxis.com"),
                Times.Once);

            _passwordHasherMock.Verify(
                hasher => hasher.VerifyHashedPassword(user, "old-hashed-password", request.CurrentPassword),
                Times.Once);

            _passwordHasherMock.Verify(
                hasher => hasher.HashPassword(user, request.NewPassword),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.UpdateAsync(user),
                Times.Once);

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Once);
        }

        [Fact]
        public async Task ChangePasswordAsync_ShouldPropagateException_WhenLookupFails()
        {
            var request = BuildValidChangePasswordDto();

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("user@healthaxis.com"))
                .ThrowsAsync(new InvalidOperationException("User lookup failed."));

            var act = async () => await _service.ChangePasswordAsync("user@healthaxis.com", request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("User lookup failed.");
        }

        [Fact]
        public async Task ChangePasswordAsync_ShouldPropagateException_WhenUpdateFails()
        {
            var request = BuildValidChangePasswordDto();

            var user = BuildUser(1, "user@healthaxis.com", UserRole.Doctor, 3);

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("user@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(user, user.PasswordHash, request.CurrentPassword))
                .Returns(PasswordVerificationResult.Success);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(user, request.NewPassword))
                .Returns("new-hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .ThrowsAsync(new InvalidOperationException("Password update failed."));

            var act = async () => await _service.ChangePasswordAsync("user@healthaxis.com", request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Password update failed.");

            _userRepositoryMock.Verify(
                repository => repository.SaveChangesAsync(),
                Times.Never);
        }

        [Fact]
        public async Task ChangePasswordAsync_ShouldPropagateException_WhenSaveFails()
        {
            var request = BuildValidChangePasswordDto();

            var user = BuildUser(1, "user@healthaxis.com", UserRole.Doctor, 3);

            _userRepositoryMock
                .Setup(repository => repository.GetByEmailAsync("user@healthaxis.com"))
                .ReturnsAsync(user);

            _passwordHasherMock
                .Setup(hasher => hasher.VerifyHashedPassword(user, user.PasswordHash, request.CurrentPassword))
                .Returns(PasswordVerificationResult.Success);

            _passwordHasherMock
                .Setup(hasher => hasher.HashPassword(user, request.NewPassword))
                .Returns("new-hashed-password");

            _userRepositoryMock
                .Setup(repository => repository.UpdateAsync(user))
                .Returns(Task.CompletedTask);

            _userRepositoryMock
                .Setup(repository => repository.SaveChangesAsync())
                .ThrowsAsync(new InvalidOperationException("Password save failed."));

            var act = async () => await _service.ChangePasswordAsync("user@healthaxis.com", request);

            await act.Should()
                .ThrowAsync<InvalidOperationException>()
                .WithMessage("Password save failed.");
        }

        #endregion

        #region Helpers

        private static IConfiguration BuildConfiguration()
        {
            var values = new Dictionary<string, string?>
            {
                ["Jwt:Key"] = "ThisIsAReallyLongJwtSigningKeyForUnitTests1234567890",
                ["Jwt:Issuer"] = "HealthAxis.Tests",
                ["Jwt:Audience"] = "HealthAxis.TestClients",
                ["Jwt:AccessTokenExpirationMinutes"] = "60"
            };

            return new ConfigurationBuilder()
                .AddInMemoryCollection(values)
                .Build();
        }

        private static RegisterDto BuildRegisterDto()
        {
            return new RegisterDto
            {
                Email = "new.user@healthaxis.com",
                Password = "Password@123",
                ConfirmPassword = "Password@123",
                Role = UserRole.Admin,
                ReferenceId = null
            };
        }

        private static RegisterPatientDto BuildRegisterPatientDto()
        {
            return new RegisterPatientDto
            {
                FullName = "Patient User",
                Email = "new.patient@healthaxis.com",
                Password = "Password@123",
                ConfirmPassword = "Password@123",
                DateOfBirth = new DateOnly(1995, 5, 10),
                Gender = Gender.Male,
                PhoneNumber = "9876543210",
                InsuranceNumber = "INS1001"
            };
        }

        private static ChangePasswordDto BuildValidChangePasswordDto()
        {
            return new ChangePasswordDto
            {
                CurrentPassword = "OldPassword@123",
                NewPassword = "NewPassword@123",
                ConfirmNewPassword = "NewPassword@123"
            };
        }

        private static User BuildUser(
            int userId,
            string email,
            UserRole role,
            int? referenceId)
        {
            return new User
            {
                UserId = userId,
                Email = email,
                PasswordHash = "old-hashed-password",
                Role = role,
                ReferenceId = referenceId,
                CreatedDate = DateTime.UtcNow.AddDays(-1),
                MustChangePassword = false,
                RefreshToken = "old-refresh-token",
                RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(1)
            };
        }

        private static Dictionary<string, string> ReadClaims(string accessToken)
        {
            var token = new JwtSecurityTokenHandler()
                .ReadJwtToken(accessToken);

            return token.Claims
                .GroupBy(claim => claim.Type)
                .ToDictionary(
                    group => group.Key,
                    group => group.First().Value);
        }

        #endregion
    }
}

