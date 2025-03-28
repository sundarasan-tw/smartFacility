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

## Submitting Changes

Refer to [GitHub's guide on creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) for submitting your changes.

## Need Help?
If you have any questions or need assistance, feel free to open an issue or reach out to the maintainers.

Thank you for contributing!
