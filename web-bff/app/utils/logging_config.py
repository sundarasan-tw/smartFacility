import json
import logging
import logging.config
from pathlib import Path

# Create logs directory if not exists
LOG_DIR = Path("logs")
LOG_DIR.mkdir(exist_ok=True)

# Load logging configuration from external JSON file
LOGGING_CONFIG_FILE = Path("app/config/logging_config.json")  # Updated path
if LOGGING_CONFIG_FILE.exists():
    with open(LOGGING_CONFIG_FILE) as config_file:
        LOGGING_CONFIG = json.load(config_file)
else:
    raise FileNotFoundError(
        f"Logging configuration file not found: {LOGGING_CONFIG_FILE}"
    )

# Apply logging configuration
logging.config.dictConfig(LOGGING_CONFIG)
logger = logging.getLogger("fastapi_app")
