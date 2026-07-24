import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

import {
  CancelAppointmentRequest,
  CreateAppointmentRequest
} from '../../shared/models/appointment.models';

import { PatientAppointment } from '../../shared/models/patient-dashboard.models';

@Injectable({
  providedIn: 'root'
})
export class AppointmentService {
  private readonly apiBaseUrl = environment.apiBaseUrl;
  constructor(private readonly http: HttpClient) { }

  createAppointment(request: CreateAppointmentRequest): Observable<PatientAppointment> {
    return this.http.post<PatientAppointment>(
      `${this.apiBaseUrl}/appointments`,
      request
    );
  }

  getPatientAppointments(patientId: number): Observable<PatientAppointment[]> {
    return this.http.get<PatientAppointment[]>(
      `${this.apiBaseUrl}/appointments/patient/${patientId}`
    );
  }

  cancelAppointment(
    appointmentId: number,
    request: CancelAppointmentRequest
  ): Observable<void> {
    return this.http.put<void>(
      `${this.apiBaseUrl}/appointments/${appointmentId}/cancel`,
      request
    );
  }
}
