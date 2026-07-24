using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace S4_HealthAxisApi.Migrations
{
    /// <inheritdoc />
    public partial class Phase2_ProductionDatabaseConstraints : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Appointments_PatientId",
                table: "Appointments");

            migrationBuilder.DeleteData(
                table: "Appointments",
                keyColumn: "AppointmentId",
                keyValue: 1);

            migrationBuilder.RenameIndex(
                name: "IX_HealthRecords_AppointmentId",
                table: "HealthRecords",
                newName: "UX_HealthRecords_AppointmentId");

            migrationBuilder.RenameIndex(
                name: "IX_Appointments_DoctorId_ScheduledDate_TimeSlot",
                table: "Appointments",
                newName: "UX_Appointments_Doctor_Date_TimeSlot");

            migrationBuilder.CreateIndex(
                name: "UX_Appointments_Patient_Date_TimeSlot",
                table: "Appointments",
                columns: new[] { "PatientId", "ScheduledDate", "TimeSlot" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "UX_Appointments_Patient_Date_TimeSlot",
                table: "Appointments");

            migrationBuilder.RenameIndex(
                name: "UX_HealthRecords_AppointmentId",
                table: "HealthRecords",
                newName: "IX_HealthRecords_AppointmentId");

            migrationBuilder.RenameIndex(
                name: "UX_Appointments_Doctor_Date_TimeSlot",
                table: "Appointments",
                newName: "IX_Appointments_DoctorId_ScheduledDate_TimeSlot");

            migrationBuilder.InsertData(
                table: "Appointments",
                columns: new[] { "AppointmentId", "CancellationReason", "DoctorId", "PatientId", "ScheduledDate", "Status", "TimeSlot" },
                values: new object[] { 1, null, 1, 1, new DateOnly(2026, 7, 20), 0, 1 });

            migrationBuilder.CreateIndex(
                name: "IX_Appointments_PatientId",
                table: "Appointments",
                column: "PatientId");
        }
    }
}
