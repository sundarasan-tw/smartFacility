# Contributing to Smart Facility

Thank you for considering contributing to the Smart Facility project! We welcome contributions in the form of bug reports, feature requests, code contributions, and documentation improvements.

## Index
1. [Folder Structure](#folder-structure)
2. [Development Workflow](#development-workflow)
   - [Running the App](#running-the-app)
   - [Running Sonar Scan](#running-sonar-scan)
   <!-- - [Running Tests](#running-tests) -->
3. [Submitting Changes](#submitting-changes)
4. [Need Help?](#need-help)

## Folder Structure
```
smartFacility/
├── web-bff/               # BFF the web application
│   ├── app/               # Application source code
│   ├── tests/             # Test cases
│   ├── Makefile           # Makefile for web-bff
|   |── Dockerfile         # Production dockerfile
|   |── Dockerfile.dev     # Local development dockerfile
├── scripts/               # Scripts for local development
├── Makefile               # Root Makefile for managing sub-projects
├── CONTRIBUTING.md        # Contribution guidelines
├── README.md              # Project overview and setup instructions
```

## Development Workflow

### Running the App
To run the Web BFF app locally:
```bash
./scripts/dev-run-bff.sh
```

### Adding the dependency
To add dependency to the Web BFF app:
```bash
./scripts/dev-run-bff.sh poetry-add package={package-name}
```

### Running the tests
To run tests for Web BFF app:
```bash
./scripts/dev-run-bff.sh test
```

### Capturing the test reports
To capture the test reports Web BFF app:
```bash
./scripts/dev-run-bff.sh test-report
```

---

### Running Sonar Scan

---

### One Time Setup

#### 1. Start SonarQube Server
Run the following command to start the SonarQube server and its PostgreSQL dependency as Docker containers:

```sh
docker-compose -f docker-compose-sonarqube.yml up -d
```

This will start the SonarQube server at [http://localhost:9001](http://localhost:9001).

_Note: If your SonarQube server exits immediately due to a lack of virtual memory space, try running following these steps - [Troubleshooting SonarQube Installation](FAQ.md#troubleshooting-sonarqube-installation)_

#### 2. Access SonarQube
Open your browser and navigate [here](http://localhost:9001)

Use the default credentials to log in:
- **Username**: `admin`
- **Password**: `admin`

After logging in, SonarQube will prompt you to create a new password. Set your new password.

#### 3. Create a Project and Obtain Token
1. Once logged in, create a new project of type local with project key as `web-bff`.
2. Generate a **project token** for authentication. Be sure to copy and save it securely — it won’t be shown again.

#### 4. Update Sonar Scanner Configuration
In the [`sonar-scanner.properties`](web-bff/sonar-scanner.properties.example) file located inside [`web-bff`](web-bff/) directory, replace the existing token with your new token under the key `sonar.token`.

_If you don't have `web-bff/sonar-scanner.properties` then please refer to [project setup section](README.md#project-setup) to know how to create configuration files._

---

### Run Sonar Scanner
Execute the following script to analyze the project:

```bash
./scripts/sonar-scan.sh
```

This will successfully scan the project and upload the results to SonarQube.

---

## Submitting Changes

Refer to [GitHub's guide on creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) for submitting your changes.

## Need Help?
If you have any questions or need assistance, feel free to open an issue or reach out to the maintainers.

Thank you for contributing!
