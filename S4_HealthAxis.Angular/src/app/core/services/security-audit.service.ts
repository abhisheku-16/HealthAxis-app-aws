import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
export interface ForbiddenAccessLogRequest {
  attemptedPath: string;
  userRole: string;
  requiredRoles: string[];
}

@Injectable({
  providedIn: 'root'
})
export class SecurityAuditService {
  private readonly apiUrl = `${environment.apiBaseUrl}/security-audit`;

  constructor(private readonly http: HttpClient) {}

  logForbiddenAccess(
    request: ForbiddenAccessLogRequest
  ): Observable<void> {
    return this.http.post<void>(
      `${this.apiUrl}/forbidden-access`,
      request
    );
  }
}
