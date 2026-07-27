import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-patient-layout',
  standalone: true, /* Required to use the imports array below */
  imports: [RouterModule], /* Tells Angular how to read <router-outlet> and routerLink */
  templateUrl: './patient-layout.html',
  styleUrls: ['./patient-layout.css']
})
export class PatientLayout {
  isMobileMenuOpen = false;

  toggleMobileMenu() {
    this.isMobileMenuOpen = !this.isMobileMenuOpen;
  }

  closeMobileMenu() {
    this.isMobileMenuOpen = false;
  }
}