import { Component } from '@angular/core';

@Component({
  selector: 'app-patient-layout',
  templateUrl: './patient-layout.html',
  styleUrls: ['./patient-layout.css']
})
export class PatientLayoutComponent {
  isMobileMenuOpen = false;

  toggleMobileMenu() {
    this.isMobileMenuOpen = !this.isMobileMenuOpen;
  }

  closeMobileMenu() {
    this.isMobileMenuOpen = false;
  }
}