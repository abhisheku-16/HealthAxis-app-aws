# [HealthAxis](http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com)

**A comprehensive clinic and healthcare appointment management system.**

**Live Deployment URL:** [http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com](http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com)

---

## Table of Contents

1. [Overview](https://www.google.com/search?q=%23overview)
2. [Problem Statement](https://www.google.com/search?q=%23problem-statement)
3. [Key Features](https://www.google.com/search?q=%23key-features)
4. [Architecture Overview](https://www.google.com/search?q=%23architecture-overview)
5. [Repository Structure](https://www.google.com/search?q=%23repository-structure)
6. [Technology Stack](https://www.google.com/search?q=%23technology-stack)
7. [Prerequisites](https://www.google.com/search?q=%23prerequisites)
8. [Local Setup Instructions](https://www.google.com/search?q=%23local-setup-instructions)
9. [Configuration](https://www.google.com/search?q=%23configuration)
10. [Build and Publish Instructions](https://www.google.com/search?q=%23build-and-publish-instructions)
11. [Static Hosting Notes for Angular and Blazor](https://www.google.com/search?q=%23static-hosting-notes-for-angular-and-blazor)
12. [Database Notes](https://www.google.com/search?q=%23database-notes)
13. [Messaging Notes](https://www.google.com/search?q=%23messaging-notes)
14. [Health Checks and Troubleshooting](https://www.google.com/search?q=%23health-checks-and-troubleshooting)
15. [AWS Elastic Beanstalk Deployment](https://www.google.com/search?q=%23aws-elastic-beanstalk-deployment)
16. [Jenkins CI/CD Pipeline](https://www.google.com/search?q=%23jenkins-cicd-pipeline)
17. [Testing](https://www.google.com/search?q=%23testing)
18. [Security Considerations](https://www.google.com/search?q=%23security-considerations)
19. [Known Limitations / Future Improvements](https://www.google.com/search?q=%23known-limitations--future-improvements)
20. [Screenshots](https://www.google.com/search?q=%23screenshots)
21. [API Endpoints](https://www.google.com/search?q=%23api-endpoints)
22. [Developer Workflow](https://www.google.com/search?q=%23developer-workflow)
23. [License](https://www.google.com/search?q=%23license)

---

## Overview

HealthAxis is a multi-application, full-stack clinic management system designed to streamline healthcare workflows. By integrating a centralized ASP.NET Core Web API with dual frontend applications—an Angular application for public/doctor workflows and a Blazor WebAssembly application for administrative tasks—the platform provides a cohesive, end-to-end solution.

The system relies on a robust backend utilizing Entity Framework Core, SQL Server, and event-driven messaging via RabbitMQ and MassTransit to guarantee reliable appointment processing. The production environment is hosted on AWS Elastic Beanstalk (Linux) using a fully automated Jenkins CI/CD pipeline.

## Problem Statement

Modern clinics face significant operational complexity when managing appointments, patient histories, and doctor schedules manually or via disjointed systems. Challenges include:

* Inefficient manual appointment handling and coordination.
* Fragmented patient histories and health records across multiple documents.
* A lack of integrated administrative oversight for clinic managers.
* Unreliable backend processing for high-volume appointment bookings and notifications.

HealthAxis solves these challenges by digitizing the entire lifecycle—from patient registration and appointment booking to health record management and administrative reporting—into one highly available, secure system.

## Key Features

* **Authentication and Authorization:** Secure, role-based access control via JWT authentication.
* **Patient Workflows:** Patient registration, login, secure profile management, and appointment history views.
* **Doctor Workflows:** Doctor dashboard, scheduled appointment views, patient history access, and schedule management.
* **Appointment Management:** Real-time appointment booking, tracking, and asynchronous status processing.
* **Health Records/History:** Centralized, accessible patient health records integrated directly into doctor workflows.
* **Admin/Blazor Workflows:** Dedicated Blazor WebAssembly frontend focused on administrative tools and management.
* **Messaging and Background Integration:** Event-driven architecture using MassTransit and RabbitMQ for decoupled appointment processing.
* **Health/Readiness Checks:** Built-in API endpoints for infrastructure readiness (`/health/ready`) and application liveness (`/health`).
* **CI/CD and Cloud Deployment:** Zero-downtime deployment pipelines targeting AWS Elastic Beanstalk via Jenkins.

## Architecture Overview

The system employs a separated frontend client architecture hosted via a single API backend. The ASP.NET Core Web API serves both the Angular and Blazor static files from its `wwwroot` directory while concurrently acting as the RESTful backend for both applications. Asynchronous tasks (like appointment finalization) are offloaded to RabbitMQ.

```text
       [Client Browser]
              |
              | (HTTP/HTTPS)
              v
 [ AWS Elastic Beanstalk (NGINX) ]
              |
              +---> /Angular/* (Static Files)
              |
              +---> /Blazor/* (Static Files)
              |
              +---> /api/* (ASP.NET Core Web API)
                             |
         +-------------------+-------------------+
         |                                       |
         v                                       v
 [ EC2: SQL Server ]                 [ EC2: RabbitMQ ]
 (EF Core Persistence)              (MassTransit Events)

```

**Why the API serves the SPAs:** This architecture reduces infrastructure overhead and CORS complexity by allowing the backend API and both frontends to exist on a single origin, sharing the same Elastic Beanstalk instance and reverse proxy.

## Repository Structure

```text
S5_HealthAxis/
├── S4_HealthAxisApi/             # Main ASP.NET Core API project & hosting shell
│   ├── wwwroot/
│   │   ├── Angular/              # Compiled Angular application (generated during build)
│   │   └── Blazor/               # Published Blazor WASM application (generated during build)
├── S4_HealthAxis.Angular/        # Angular frontend source code (Patients, Doctors, UI)
├── S4_HealthAxis.Blazor/         # Blazor WebAssembly frontend source code (Admin tools)
├── S4_HealthAxis.Shared/         # Shared DTOs, models, and interface contracts
├── S4_HealthAxis.Tests/          # Automated test suite (xUnit/NUnit/MSTest)
├── S4_HealthAxis.slnx            # .NET Solution file
└── Jenkinsfile                   # Groovy CI/CD declarative pipeline definition

```

## Technology Stack

* **Backend:** ASP.NET Core / .NET 10, Entity Framework Core, Serilog, JWT.
* **Frontend (Public/Doctor):** Angular, TypeScript, Bootstrap, Bootstrap Icons.
* **Frontend (Admin):** Blazor WebAssembly.
* **Database:** Microsoft SQL Server.
* **Messaging:** RabbitMQ, MassTransit.
* **Cloud/DevOps:** AWS Elastic Beanstalk (Linux), AWS EC2, AWS S3.
* **CI/CD:** Jenkins, Git/GitHub.

## Prerequisites

To run and develop HealthAxis locally, ensure the following are installed:

* [.NET 10 SDK](https://www.google.com/search?q=https://dotnet.microsoft.com/download)
* [Node.js and npm](https://www.google.com/search?q=https://nodejs.org/) (latest LTS recommended)
* SQL Server (LocalDB, Developer Edition, or Docker container)
* RabbitMQ (Local installation or Docker container)
* Git CLI
* AWS CLI (If interacting with cloud resources)

## Local Setup Instructions

Follow these steps in a Windows PowerShell terminal to set up the development environment:

1. **Clone the repository:**
```powershell
git clone -b <branch-name> <repository-url> HealthAxis
cd HealthAxis

```


2. **Restore .NET dependencies:**
```powershell
dotnet restore S4_HealthAxis.slnx

```


3. **Install Angular dependencies:**
```powershell
cd S4_HealthAxis.Angular
npm install
cd ..

```


4. **Configure Local Settings:**
Update `S4_HealthAxisApi/appsettings.Development.json` (or use User Secrets) to point to your local SQL Server and RabbitMQ instances.
5. **Build the solution:**
```powershell
dotnet build S4_HealthAxis.slnx

```


6. **Run tests (optional but recommended):**
```powershell
dotnet test S4_HealthAxis.slnx

```


7. **Run the API:**
```powershell
cd S4_HealthAxisApi
dotnet run

```


8. **Access the applications:**
* API / Swagger: `http://localhost:5000/swagger`
* Angular App (served locally via Angular CLI usually, or via API if built): `http://localhost:5000/Angular`
* Blazor App (if published): `http://localhost:5000/Blazor`



## Configuration

The application relies on the following environment variables (defined in `appsettings.json`, AWS Elastic Beanstalk environment configurations, or OS variables):

| Variable Name | Description | Example |
| --- | --- | --- |
| `ASPNETCORE_ENVIRONMENT` | Defines the hosting environment. | `Production` |
| `ASPNETCORE_URLS` | Binding URLs for Kestrel. | `http://+:5000` |
| `ConnectionStrings__Default` | EF Core mapping to SQL Server. | `Server=10.20.13.213,1433;Database=HealthAxis...` |
| `RabbitMq__Host` | Message broker host IP/DNS. | `10.20.13.213` |
| `RabbitMq__Port` | Message broker port. | `5672` |
| `RabbitMq__Username` | RabbitMQ user credential. | `admin` |
| `RabbitMq__Password` | RabbitMQ password credential. | `******` |
| `RabbitMq__VirtualHost` | RabbitMQ vhost. | `/` |
| `RabbitMq__UseSsl` | Enables secure RabbitMQ connections. | `false` |
| `RabbitMq__AppointmentQueue` | Queue name for appointments. | `appointment-booked-queue` |
| `JwtSettings__Secret` | Key for JWT token signing. | `[VerySecretKey...]` |
| `JwtSettings__Issuer` | Valid token issuer. | `HealthAxis` |
| `JwtSettings__Audience` | Valid token audience. | `HealthAxisUsers` |
| `Cors__AllowedOrigins__0` | Allowed origin for API requests. | `http://healthaxis-v2-dev...` |
| `ElasticSearch__Enabled` | Feature flag for Elasticsearch. | `false` |

*⚠️ **WARNING:** Never commit production secrets or connection strings to source control. Use environment variables or a secure vault.*

## Build and Publish Instructions

To manually replicate the CI pipeline build process:

```powershell
# 1. Restore & Build .NET Solution
dotnet restore S4_HealthAxis.slnx
dotnet build S4_HealthAxis.slnx -c Release --no-restore

# 2. Test
dotnet test S4_HealthAxis.slnx -c Release --no-build

# 3. Build Angular (Ensure Angular Budgets are configured appropriately)
cd S4_HealthAxis.Angular
npm run build
cd ..

# 4. Publish Blazor to temporary folder
dotnet publish "S4_HealthAxis.Blazor\S4_HealthAxis.Blazor.csproj" -c Release -o blazor-publish-temp

# 5. Move Blazor to API wwwroot
# Ensure base href is <base href="/Blazor/" /> in S4_HealthAxis.Blazor/wwwroot/index.html
if (Test-Path "S4_HealthAxisApi\wwwroot\Blazor") { Remove-Item -Recurse -Force "S4_HealthAxisApi\wwwroot\Blazor" }
New-Item -ItemType Directory -Path "S4_HealthAxisApi\wwwroot\Blazor"
Copy-Item -Path "blazor-publish-temp\wwwroot\*" -Destination "S4_HealthAxisApi\wwwroot\Blazor" -Recurse

# 6. Publish API
dotnet publish "S4_HealthAxisApi\S4_HealthAxisApi.csproj" -c Release -o publish

```

## Static Hosting Notes for Angular and Blazor

Because the API serves multiple SPAs, strict fallback routing is implemented in the API `Program.cs`.

* **Angular:** Routed under `/Angular`. Falls back via `app.MapFallbackToFile("/Angular/{*path:nonfile}", "Angular/index.html");`
* **Blazor:** Routed under `/Blazor`. Falls back via `app.MapFallbackToFile("/Blazor/{*path:nonfile}", "Blazor/index.html");`
* **Important:** Direct navigation to a Blazor route (e.g., `/Blazor/login`) will return a 404 if the static files are nested incorrectly (e.g., `wwwroot/Blazor/wwwroot/`) or if the base href is missing the trailing slash.

## Database Notes

* Data persistence is handled by Entity Framework Core (EF Core) utilizing Microsoft SQL Server.
* The configuration expects the connection string to be named `Default` (mapped via env var `ConnectionStrings__Default`).
* Database migrations/seeding should be managed according to project-specific administrative workflows, as EF CLI commands may vary by environment.

## Messaging Notes

* Integration between micro-services or async background workers is facilitated by MassTransit over RabbitMQ.
* The primary queue in use is `appointment-booked-queue`.
* If the RabbitMQ host is down or unreachable, the application's `/health/ready` endpoint will intentionally fail, preventing unhealthy nodes from receiving traffic.

## Health Checks and Troubleshooting

Two primary health endpoints are exposed:

* `GET /health`: Validates that the .NET process is alive and responding (Liveness).
* `GET /health/ready`: Validates that required external infrastructure (SQL Server, RabbitMQ) is reachable (Readiness).

**Common Troubleshooting Scenarios:**

* **API Fails to Start (CORS):** Ensure `Cors__AllowedOrigins__0` is present and strictly formatted (no trailing slashes, e.g., `[http://example.com](http://example.com)`).
* **Readiness Check Fails / 502 Bad Gateway:** The API cannot reach the EC2 instance hosting SQL Server/RabbitMQ at `10.20.13.213`. Verify the Elastic Beanstalk instance resides in the correct VPC and Subnet.
* **Blazor Returns 404:** Check the artifact zip to ensure the Blazor publish step outputted to `wwwroot/Blazor` and not `wwwroot/Blazor/wwwroot`.
* **Angular Pipeline Failures:** Ensure `angular.json` budgets (e.g., `anyComponentStyle`) are high enough (e.g., `20kB`) to prevent budget limit build errors.

## AWS Elastic Beanstalk Deployment

The production application is hosted on AWS Elastic Beanstalk (Linux).

* **Current Environment:** `healthaxis-v2-dev` (Application: `healthaxis-v2`) in region `ap-south-1`.
* **Live URL:** `[http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com](http://healthaxis-v2-dev.eba-pbcv4if3.ap-south-1.elasticbeanstalk.com)`
* **VPC & Networking:** The EB environment *must* be deployed into the same VPC as the database/messaging EC2 instances to allow private routing to `10.20.13.213`.
* **Security Groups:** The EC2 Security Group for SQL/RabbitMQ must allow inbound TCP `1433` (SQL) and `5672` (RabbitMQ) specifically from the Elastic Beanstalk Security Group.
* **Procfile:** A `Procfile` is generated during the pipeline to explicitly instruct the AWS environment how to start the .NET API:
```text
web: dotnet S4_HealthAxisApi.dll

```



## Jenkins CI/CD Pipeline

Deployment is fully automated using a Jenkins declarative pipeline running on a Windows agent.
The process flows as follows:

1. **Checkout:** Pulls source code from GitHub.
2. **Build Angular:** Runs `npm install` and `npm run build` in the Angular directory.
3. **Publish Blazor:** Publishes the WASM app and explicitly copies its `wwwroot` to the API's static directory.
4. **Build and Test:** Restores, builds, and tests the `.slnx` solution.
5. **Publish API & Procfile:** Generates the API deployment artifacts and a `Procfile`.
6. **Verify & Zip:** Asserts the existence of critical DLLs and index.html files, then zips the directory.
7. **Upload to S3 & Deploy to EB:** Authenticates via the Jenkins credential `aws-eb-credentials`, uploads the artifact to the `healthaxis-db-script-bucket` S3 bucket, creates an Elastic Beanstalk Application Version, and triggers an environment update.
8. **Wait:** Polls AWS until the deployment is marked healthy.

## Testing

The repository contains a comprehensive suite of automated tests located in `S4_HealthAxis.Tests`.

* **Current Status:** Passing. The suite recently verified 355/355 tests successfully.
* **Run command:**
```powershell
dotnet test S4_HealthAxis.slnx -c Release

```



## Security Considerations

* **Secrets Management:** Do not commit `appsettings.json` with active connection strings or JWT secrets. Rely entirely on AWS Elastic Beanstalk environment variables or Jenkins credential stores.
* **Credential Rotation:** If JWT signing keys or RabbitMQ/SQL passwords leak, they must be rotated immediately via environment config.
* **Network Isolation:** Ensure the SQL Server and RabbitMQ EC2 instances do *not* have public IP addresses or wide-open inbound rules. All traffic should route through the VPC peering/security groups.

## Known Limitations / Future Improvements

* **Centralized Secret Management:** Migrate from environment variables to AWS Secrets Manager or AWS Systems Manager (SSM) Parameter Store.
* **HTTPS/SSL:** Apply an SSL certificate via AWS Certificate Manager (ACM) to the Elastic Beanstalk load balancer and configure a custom domain.
* **Database Migrations:** Automate EF Core migrations within the Jenkins pipeline or a dedicated init container.
* **Observability:** Integrate centralized dashboarding for Serilog outputs (e.g., CloudWatch, Datadog, or Elasticsearch/Kibana).
* **Blue/Green Deployments:** Configure Elastic Beanstalk to utilize immutable updates or traffic-splitting for zero-risk deployments.

## Screenshots

*(UI visuals demonstrating the system in action)*

* *Placeholder: Angular Login Interface*
* *Placeholder: Angular Patient Dashboard*
* *Placeholder: Angular Doctor Schedule & Health Records*
* *Placeholder: Blazor Admin Management Portal*

## API Endpoints

A representative sample of the REST API surface:

* `POST /api/auth/login` - Authenticates user and returns JWT.
* `GET /api/patients/{id}` - Retrieves patient details.
* `GET /api/appointments/patient/{patientId}` - Lists appointments for a specific patient.
* `GET /health` - Liveness probe.
* `GET /health/ready` - Infrastructure readiness probe.

## Developer Workflow

1. Check out a new feature branch from `main`.
2. Develop features locally, ensuring both API unit tests and Angular/Blazor UI interactions are verified.
3. **Run tests locally** (`dotnet test`) prior to pushing code.
4. **Do not commit** `bin/`, `obj/`, `node_modules/`, `publish/`, or static compiled folders.
5. Open a Pull Request. Upon merge to `main`, Jenkins will automatically begin the deployment lifecycle to AWS.
