HEALTHAXIS
===========

HealthAxis is a full-stack clinic and appointment management platform designed to simulate real-world healthcare operations. The solution combines an ASP.NET Core Web API backend, an Angular application for patients and doctors, a Blazor WebAssembly administration portal, SQL Server for data persistence, RabbitMQ with MassTransit for messaging, and AWS Elastic Beanstalk for deployment.

The objective of the project is to provide a practical healthcare scheduling and records system while demonstrating enterprise application architecture, authentication, messaging patterns, automated deployment, and cloud hosting.

=================================================================
TECHNOLOGY STACK
=================================================================

Backend
- .NET 10
- ASP.NET Core Web API
- Entity Framework Core
- SQL Server
- JWT Authentication
- Role-Based Authorization
- Serilog Logging

Frontend
- Angular
- TypeScript
- Bootstrap
- Blazor WebAssembly

Messaging
- RabbitMQ
- MassTransit
- appointment-booked-queue

Cloud & DevOps
- AWS Elastic Beanstalk
- Amazon S3
- Jenkins
- GitHub

=================================================================
LIVE ENVIRONMENT
=================================================================

Angular Application
http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com/Angular/

API Base URL
http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com

Health Check
http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com/health

Readiness Check
http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com/health/ready

=================================================================
SCREENSHOT LOCATION
=================================================================

docs/screenshots/

docs/screenshots/healthaxis-landing.png
docs/screenshots/angular-login.png
docs/screenshots/angular-register.png
docs/screenshots/patient-dashboard.png
docs/screenshots/patient-appointments.png
docs/screenshots/patient-history.png
docs/screenshots/doctor-dashboard.png
docs/screenshots/blazor-admin.png

=================================================================
CORE FEATURES
=================================================================

Authentication
- Secure JWT-based authentication
- Role-aware access control
- Protected API endpoints

Patient Functions
- Patient registration
- Secure login
- Profile management
- Appointment booking
- Appointment history
- Health record viewing

Doctor Functions
- Doctor dashboard
- Schedule management
- Appointment review

Appointment Management
- Doctor-to-patient scheduling
- Validation of available slots
- Appointment history tracking
- Event publishing through RabbitMQ

Health Records
- Appointment-linked records
- Historical consultation visibility

Administration
- Dedicated Blazor-based administration portal
- Separated from patient-facing functionality

=================================================================
ARCHITECTURE OVERVIEW
=================================================================

Browser
  |-- Angular (/Angular/)
  |-- Blazor (/Blazor/)
           |
           v
ASP.NET Core API (S4_HealthAxisApi)
           |
           +-- SQL Server
           +-- MassTransit
                   |
               RabbitMQ

Application Routing

/Angular/   -> Angular application
/Blazor/    -> Blazor WebAssembly portal
/api/*      -> API endpoints
/health     -> Liveness endpoint
/health/ready -> Readiness endpoint

=================================================================
REPOSITORY STRUCTURE
=================================================================

HealthAxis/
│
├── S4_HealthAxis.slnx
├── S4_HealthAxisApi/
│   └── wwwroot/
│       ├── Angular/
│       └── Blazor/
├── S4_HealthAxis.Angular/
├── S4_HealthAxis.Blazor/
├── S4_HealthAxis.Shared/
├── S4_HealthAxis.Tests/
├── docs/
└── Jenkinsfile

=================================================================
LOCAL DEVELOPMENT SETUP
=================================================================

Prerequisites

- .NET 10 SDK
- Node.js
- npm
- SQL Server
- RabbitMQ
- Git

Clone Repository

git clone https://github.com/<your-user-or-org>/<your-repo>.git
cd <your-repo>

Restore Packages

dotnet restore .\S4_HealthAxis.slnx

Install Angular Dependencies

cd .\S4_HealthAxis.Angular
npm ci
cd ..

Required Configuration Areas

ConnectionStrings:Default
JwtSettings
RabbitMq
Cors
ElasticSearch

Database Update

dotnet ef database update --project .\S4_HealthAxisApi\S4_HealthAxisApi.csproj

Build Solution

dotnet build .\S4_HealthAxis.slnx -c Release

Run Tests

dotnet test .\S4_HealthAxis.slnx -c Release

Run API

dotnet run --project .\S4_HealthAxisApi\S4_HealthAxisApi.csproj

=================================================================
ANGULAR BUILD
=================================================================

cd .\S4_HealthAxis.Angular
npm run build
cd ..

Output Location

S4_HealthAxisApi\wwwroot\Angular

=================================================================
BLAZOR PUBLISH
=================================================================

The Blazor WebAssembly application is published and copied into:

S4_HealthAxisApi\wwwroot\Blazor

Required Validation

S4_HealthAxisApi\wwwroot\Blazor\index.html
S4_HealthAxisApi\wwwroot\Blazor\_framework

=================================================================
DATABASE CONFIGURATION
=================================================================

Connection String Key

ConnectionStrings__Default

Infrastructure Endpoints

SQL Server:
10.20.13.213:1433

RabbitMQ:
10.20.13.213:5672

=================================================================
ENVIRONMENT VARIABLES
=================================================================

ASPNETCORE_ENVIRONMENT
ASPNETCORE_URLS
ConnectionStrings__Default
JwtSettings__Secret
JwtSettings__Issuer
JwtSettings__Audience
RabbitMq__Host
RabbitMq__Port
RabbitMq__Username
RabbitMq__Password
RabbitMq__VirtualHost
RabbitMq__UseSsl
RabbitMq__AppointmentQueue
Cors__AllowedOrigins__0
ElasticSearch__Enabled

=================================================================
DEPLOYMENT
=================================================================

Deployment Flow

GitHub
 -> Jenkins
 -> Build
 -> Test
 -> Angular Build
 -> Blazor Publish
 -> API Publish
 -> ZIP Package
 -> Amazon S3
 -> Elastic Beanstalk Version
 -> Elastic Beanstalk Environment

AWS Environment

AWS Region:
ap-south-1

Elastic Beanstalk Application:
healthaxis-v2

Elastic Beanstalk Environment:
healthaxis-v2-dev

Elastic Beanstalk URL:
http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com

S3 Bucket:
healthaxis-db-script-bucket

=================================================================
JENKINS PIPELINE
=================================================================

1. Checkout source code
2. Restore dependencies
3. Build solution
4. Execute tests
5. Build Angular application
6. Publish Blazor application
7. Copy Blazor output to API host
8. Publish API
9. Generate deployment package
10. Upload package to S3
11. Create Elastic Beanstalk application version
12. Deploy environment update
13. Verify deployment status

Environment Variables

AWS_REGION=ap-south-1
EB_APPLICATION_NAME=healthaxis-v2
EB_ENVIRONMENT_NAME=healthaxis-v2-dev
S3_BUCKET=healthaxis-db-script-bucket

=================================================================
API EXAMPLES
=================================================================

POST  /api/auth/login
GET   /api/patients/{id}
GET   /api/appointments/patient/{patientId}
GET   /health
GET   /health/ready

=================================================================
TROUBLESHOOTING
=================================================================

Readiness Failure
- Verify SQL Server connectivity.
- Verify RabbitMQ connectivity.
- Validate environment variables.
- Confirm VPC and security-group access.

RabbitMQ Connectivity Issues
- Confirm service availability.
- Verify port 5672 access.
- Check RabbitMq__Host and RabbitMq__Port values.

Blazor Route Errors
- Verify published files exist under wwwroot/Blazor.
- Confirm correct base path configuration.

=================================================================
SECURITY GUIDELINES
=================================================================

- Never commit secrets to source control.
- Store AWS credentials in Jenkins credentials management.
- Restrict SQL Server access to trusted sources.
- Restrict RabbitMQ access to trusted sources.
- Rotate compromised secrets immediately.
- Enable HTTPS before production usage.

=================================================================
FUTURE IMPROVEMENTS
=================================================================

- AWS Secrets Manager integration
- Custom domain and HTTPS
- Automated database migrations
- Blue/Green deployments
- Dashboard-based monitoring
- Alerting and notification platform
- Containerization support
- Enhanced administration workflows
- End-to-end automated testing
- Improved mobile responsiveness

=================================================================
LICENSE
=================================================================

Copyright (c) 2026.
All rights reserved unless a LICENSE file states otherwise.
