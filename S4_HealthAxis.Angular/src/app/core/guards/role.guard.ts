import { inject } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  CanActivateFn,
  Router,
  RouterStateSnapshot
} from '@angular/router';

import { SecurityAuditService } from '../services/security-audit.service';
import { TokenService } from '../services/token.service';

export const roleGuard: CanActivateFn = (
  route: ActivatedRouteSnapshot,
  state: RouterStateSnapshot
) => {
  const tokenService = inject(TokenService);
  const router = inject(Router);
  const securityAuditService = inject(SecurityAuditService);

  const allowedRoles =
    route.data['roles'] as string[] | undefined;

  if (!allowedRoles?.length) {
    return true;
  }

  const currentRole =
    tokenService.getRole();

  if (currentRole && allowedRoles.includes(currentRole)) {
    return true;
  }

  securityAuditService
    .logForbiddenAccess({
      attemptedPath: state.url,
      userRole: currentRole ?? 'Unknown',
      requiredRoles: allowedRoles
    })
    .subscribe({
      next: () => {},
      error: () => {}
    });

  return router.createUrlTree(['/forbidden'], {
    queryParams: {
      from: state.url
    }
  });
};
