# Contributing to Smart Facility

Thank you for considering contributing to the Smart Facility project! We welcome contributions in the form of bug reports, feature requests, code contributions, and documentation improvements.

## Getting Started

1. Fork the repository and clone it to your local machine.
2. Ensure you have the required tools installed:
   - `mise` (a tool for managing isolated environments)
3. Navigate to the project directory and set up the environment:
   ```bash
   cd web-bff
   mise exec -- poetry install --no-root
   ```

## Development Workflow

### Running the App
To run the Web BFF app locally:
```bash
make run-bff
```

### Installing Dependencies
To add a new dependency to the Web BFF app:
```bash
make install-bff p=<package_name>
```
Replace `<package_name>` with the name of the package.

### Linting and Formatting
- To check for linting issues:
  ```bash
  make lint-bff
  ```
- To fix linting issues:
  ```bash
  make lint-fix-bff
  ```
- To format the code:
  ```bash
  make format-bff
  ```

### Running Tests
- To run the test suite:
  ```bash
  make test-bff
  ```
- To run tests with coverage:
  ```bash
  make test-cover-bff
  ```

## Submitting Changes

1. Create a new branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes and commit them with clear and descriptive messages.
3. Push your branch to your forked repository:
   ```bash
   git push origin feature/your-feature-name
   ```
4. Open a pull request to the main repository.

## Need Help?
If you have any questions or need assistance, feel free to open an issue or reach out to the maintainers.

Thank you for contributing!
