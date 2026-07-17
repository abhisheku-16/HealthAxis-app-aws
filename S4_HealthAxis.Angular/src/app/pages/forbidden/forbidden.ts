import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-forbidden',
  templateUrl: './forbidden.html',
  styleUrls: ['./forbidden.css']
})
export class ForbiddenComponent {
  constructor(private readonly router: Router) {}

  goHome(): void {
    this.router.navigate(['/']);
  }
}
