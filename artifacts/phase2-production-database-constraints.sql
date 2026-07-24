IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE TABLE [Doctors] (
        [DoctorId] int NOT NULL IDENTITY,
        [FullName] nvarchar(100) NOT NULL,
        [Email] nvarchar(256) NOT NULL,
        [Specialisation] int NOT NULL,
        [YearsOfExperience] int NOT NULL,
        [ConsultationFee] decimal(10,2) NOT NULL,
        [IsActive] bit NOT NULL,
        CONSTRAINT [PK_Doctors] PRIMARY KEY ([DoctorId])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE TABLE [Notifications] (
        [NotificationId] int NOT NULL IDENTITY,
        [DoctorId] int NOT NULL,
        [AppointmentId] int NULL,
        [Message] nvarchar(500) NOT NULL,
        [IsRead] bit NOT NULL,
        [CreatedOn] datetime2 NOT NULL,
        CONSTRAINT [PK_Notifications] PRIMARY KEY ([NotificationId])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE TABLE [Patients] (
        [PatientId] int NOT NULL IDENTITY,
        [FullName] nvarchar(40) NOT NULL,
        [DateOfBirth] date NOT NULL,
        [Gender] int NOT NULL,
        [PhoneNumber] nvarchar(15) NOT NULL,
        [Email] nvarchar(100) NOT NULL,
        [InsuranceStatus] int NOT NULL,
        [InsuranceNumber] nvarchar(50) NULL,
        [IsActive] bit NOT NULL,
        CONSTRAINT [PK_Patients] PRIMARY KEY ([PatientId])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE TABLE [Users] (
        [UserId] int NOT NULL IDENTITY,
        [Email] nvarchar(256) NOT NULL,
        [PasswordHash] nvarchar(max) NOT NULL,
        [Role] int NOT NULL,
        [ReferenceId] int NULL,
        [CreatedDate] datetime2 NOT NULL,
        [RefreshToken] nvarchar(max) NULL,
        [MustChangePassword] bit NOT NULL,
        [RefreshTokenExpiryTime] datetime2 NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([UserId])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE TABLE [Appointments] (
        [AppointmentId] int NOT NULL IDENTITY,
        [PatientId] int NOT NULL,
        [DoctorId] int NOT NULL,
        [ScheduledDate] date NOT NULL,
        [TimeSlot] int NOT NULL,
        [Status] int NOT NULL,
        [CancellationReason] nvarchar(500) NULL,
        CONSTRAINT [PK_Appointments] PRIMARY KEY ([AppointmentId]),
        CONSTRAINT [FK_Appointments_Doctors_DoctorId] FOREIGN KEY ([DoctorId]) REFERENCES [Doctors] ([DoctorId]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Appointments_Patients_PatientId] FOREIGN KEY ([PatientId]) REFERENCES [Patients] ([PatientId]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE TABLE [HealthRecords] (
        [HealthRecordId] int NOT NULL IDENTITY,
        [AppointmentId] int NOT NULL,
        [PatientId] int NOT NULL,
        [DoctorId] int NOT NULL,
        [Diagnosis] nvarchar(1000) NOT NULL,
        [Prescription] nvarchar(2000) NOT NULL,
        [Notes] nvarchar(2000) NULL,
        [CreatedOn] datetime2 NOT NULL,
        CONSTRAINT [PK_HealthRecords] PRIMARY KEY ([HealthRecordId]),
        CONSTRAINT [FK_HealthRecords_Appointments_AppointmentId] FOREIGN KEY ([AppointmentId]) REFERENCES [Appointments] ([AppointmentId]) ON DELETE NO ACTION,
        CONSTRAINT [FK_HealthRecords_Doctors_DoctorId] FOREIGN KEY ([DoctorId]) REFERENCES [Doctors] ([DoctorId]) ON DELETE NO ACTION,
        CONSTRAINT [FK_HealthRecords_Patients_PatientId] FOREIGN KEY ([PatientId]) REFERENCES [Patients] ([PatientId]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DoctorId', N'ConsultationFee', N'Email', N'FullName', N'IsActive', N'Specialisation', N'YearsOfExperience') AND [object_id] = OBJECT_ID(N'[Doctors]'))
        SET IDENTITY_INSERT [Doctors] ON;
    EXEC(N'INSERT INTO [Doctors] ([DoctorId], [ConsultationFee], [Email], [FullName], [IsActive], [Specialisation], [YearsOfExperience])
    VALUES (1, 500.0, N''arun.nair@healthaxis.com'', N''Arun Nair'', CAST(1 AS bit), 1, 8),
    (2, 1000.0, N''rohan.menon@healthaxis.com'', N''Rohan Menon'', CAST(1 AS bit), 2, 12)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'DoctorId', N'ConsultationFee', N'Email', N'FullName', N'IsActive', N'Specialisation', N'YearsOfExperience') AND [object_id] = OBJECT_ID(N'[Doctors]'))
        SET IDENTITY_INSERT [Doctors] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'PatientId', N'DateOfBirth', N'Email', N'FullName', N'Gender', N'InsuranceNumber', N'InsuranceStatus', N'IsActive', N'PhoneNumber') AND [object_id] = OBJECT_ID(N'[Patients]'))
        SET IDENTITY_INSERT [Patients] ON;
    EXEC(N'INSERT INTO [Patients] ([PatientId], [DateOfBirth], [Email], [FullName], [Gender], [InsuranceNumber], [InsuranceStatus], [IsActive], [PhoneNumber])
    VALUES (1, ''1995-05-10'', N''ayush.sharma@example.com'', N''Ayush Sharma'', 1, N''INS1001'', 2, CAST(1 AS bit), N''9876543210''),
    (2, ''2000-11-05'', N''riya.shukla@example.com'', N''Riya Shukla'', 2, N''INS1002'', 2, CAST(1 AS bit), N''9876543211'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'PatientId', N'DateOfBirth', N'Email', N'FullName', N'Gender', N'InsuranceNumber', N'InsuranceStatus', N'IsActive', N'PhoneNumber') AND [object_id] = OBJECT_ID(N'[Patients]'))
        SET IDENTITY_INSERT [Patients] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'AppointmentId', N'CancellationReason', N'DoctorId', N'PatientId', N'ScheduledDate', N'Status', N'TimeSlot') AND [object_id] = OBJECT_ID(N'[Appointments]'))
        SET IDENTITY_INSERT [Appointments] ON;
    EXEC(N'INSERT INTO [Appointments] ([AppointmentId], [CancellationReason], [DoctorId], [PatientId], [ScheduledDate], [Status], [TimeSlot])
    VALUES (1, NULL, 1, 1, ''2026-07-20'', 0, 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'AppointmentId', N'CancellationReason', N'DoctorId', N'PatientId', N'ScheduledDate', N'Status', N'TimeSlot') AND [object_id] = OBJECT_ID(N'[Appointments]'))
        SET IDENTITY_INSERT [Appointments] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Appointments_DoctorId_ScheduledDate_TimeSlot] ON [Appointments] ([DoctorId], [ScheduledDate], [TimeSlot]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Appointments_PatientId] ON [Appointments] ([PatientId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Doctors_Email] ON [Doctors] ([Email]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE UNIQUE INDEX [IX_HealthRecords_AppointmentId] ON [HealthRecords] ([AppointmentId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_HealthRecords_DoctorId] ON [HealthRecords] ([DoctorId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_HealthRecords_PatientId] ON [HealthRecords] ([PatientId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Patients_Email] ON [Patients] ([Email]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Users_Email] ON [Users] ([Email]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260711103901_InitialCreate'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20260711103901_InitialCreate', N'10.0.9');
END;

COMMIT;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260722034755_Phase2_ProductionDatabaseConstraints'
)
BEGIN
    DROP INDEX [IX_Appointments_PatientId] ON [Appointments];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260722034755_Phase2_ProductionDatabaseConstraints'
)
BEGIN
    EXEC(N'DELETE FROM [Appointments]
    WHERE [AppointmentId] = 1;
    SELECT @@ROWCOUNT');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260722034755_Phase2_ProductionDatabaseConstraints'
)
BEGIN
    EXEC sp_rename N'[HealthRecords].[IX_HealthRecords_AppointmentId]', N'UX_HealthRecords_AppointmentId', 'INDEX';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260722034755_Phase2_ProductionDatabaseConstraints'
)
BEGIN
    EXEC sp_rename N'[Appointments].[IX_Appointments_DoctorId_ScheduledDate_TimeSlot]', N'UX_Appointments_Doctor_Date_TimeSlot', 'INDEX';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260722034755_Phase2_ProductionDatabaseConstraints'
)
BEGIN
    CREATE UNIQUE INDEX [UX_Appointments_Patient_Date_TimeSlot] ON [Appointments] ([PatientId], [ScheduledDate], [TimeSlot]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260722034755_Phase2_ProductionDatabaseConstraints'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20260722034755_Phase2_ProductionDatabaseConstraints', N'10.0.9');
END;

COMMIT;
GO

