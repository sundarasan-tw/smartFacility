# Contributing to Smart Facility

Thank you for considering contributing to the Smart Facility project! We welcome contributions in the form of bug reports, feature requests, code contributions, and documentation improvements.

## Index
1. [Folder Structure](#folder-structure)
2. [Development Workflow](#development-workflow)
   - [Running the App](#running-the-app)
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

### Running sonar scan

#### 1. Start SonarQube Server
Run the following command to start the SonarQube server and its PostgreSQL dependency as Docker containers:

```sh
docker-compose -f docker-compose-sonarqube.yml up -d
```

This will start the SonarQube server at `http://localhost:9001`.

#### 2. Access SonarQube
Open your browser and navigate to:

```
http://localhost:9001
```

Use the default credentials to log in:
- **Username**: `admin`
- **Password**: `admin`

#### 3. Create a Project and Obtain Token
1. Once logged in, create a new project of type local with project key as `web-bff`.
2. Generate a **project token** for authentication.

#### 4. Update Sonar Scanner Configuration
Replace the token in the Sonar Scanner configuration file:

```
web-bff/sonar-scanner.properties
```

#### 5. Run Sonar Scanner
Execute the following script to analyze the project:

```
./scripts/sonar-scan.sh
```

This will successfully scan the project and upload the results to SonarQube.

## Troubleshooting SonarQube Installation

If your SonarQube server exits immediately due to a lack of virtual memory space, try the following steps:

1. Open a terminal and run:
   ```sh
   rdctl shell
   ```
2. Check the current virtual memory setting:
   ```sh
   sysctl vm.max_map_count
   ```
   - If the value is set to `65536`, update it.
3. Edit the `/etc/sysctl.conf` file:
   ```sh
   sudo vi /etc/sysctl.conf
   ```
4. Add the following line:
   ```sh
   vm.max_map_count = 262144
   ```
5. Save the changes.
6. Restart `sysctl` by issuing below command,
   ```bash
   sudo sysctl -p
   ```

Now, try running SonarQube again.

## Submitting Changes

Refer to [GitHub's guide on creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) for submitting your changes.

## Need Help?
If you have any questions or need assistance, feel free to open an issue or reach out to the maintainers.

Thank you for contributing!
