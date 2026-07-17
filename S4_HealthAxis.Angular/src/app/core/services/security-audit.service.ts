import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

export interface ForbiddenAccessLogRequest {
  attemptedPath: string;
  userRole: string;
  requiredRoles: string[];
}

@Injectable({
  providedIn: 'root'
})
export class SecurityAuditService {
  private readonly apiUrl = 'https://localhost:<api-port>/api/security-audit';

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
