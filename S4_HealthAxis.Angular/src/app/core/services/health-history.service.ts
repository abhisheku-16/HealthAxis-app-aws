import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

import { HealthHistoryRecord } from '../../shared/models/health-history.models';

@Injectable({
  providedIn: 'root'
})
export class HealthHistoryService {
  private readonly apiBaseUrl = environment.apiBaseUrl;

  constructor(private readonly http: HttpClient) {}

  getPatientHealthRecords(patientId: number): Observable<HealthHistoryRecord[]> {
    return this.http.get<HealthHistoryRecord[]>(
      `${this.apiBaseUrl}/patients/${patientId}/health-records`
    );
  }
}

