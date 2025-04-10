# Smart Facility
A unified platform that integrates smart devices across diverse facilities, empowering users with remote access, real-time monitoring, insights, and automated scheduling for smarter facility management.

## Project Setup

1. Ensure you have Python 3.13.2 installed on your system. You can download it from [python.org](https://www.python.org/downloads/).

2. Clone the repository:
   ```bash
   git clone <repository-url>
   cd smartFacility
   ```

3. Setup Configuration Files:
   ```bash
   ./scripts/create-config.sh
   ```
   Update the files with your local development environment details as needed. Refer [CONTRIBUTING.md](CONTRIBUTING.md) for more info.

   **Note:** When any `*.example` config file is updated, please inform the team so they can update their cloned local config files.

4. Run the application:
   ```bash
   # TODO: Add "docker compose up" command here once docker compose setup is done
   ```

### Logging
The app uses a centralized logging configuration. Logs are printed to the console in the following format:
```
<timestamp> - <logger_name> - <log_level> - <message>
```

## Additional Information

- For detailed contribution guidelines, refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Thank you for using Smart Facility!
