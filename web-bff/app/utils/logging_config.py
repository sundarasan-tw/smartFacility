import logging
import logging.config
from pathlib import Path

# Create logs directory if not exists
LOG_DIR = Path("logs")
LOG_DIR.mkdir(exist_ok=True)

# Logging Configuration
LOGGING_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "default": {"format": "%(asctime)s - %(levelname)s - %(name)s - %(message)s"},
        "detailed": {
            "format": "%(asctime)s - %(levelname)s - %(name)s - %(filename)s - %(lineno)d - %(message)s"
        },
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "default",
            "level": "DEBUG",
        },
        "file": {
            "class": "logging.FileHandler",
            "filename": LOG_DIR / "app.log",
            "formatter": "detailed",
            "level": "DEBUG",
            "mode": "a",  # Append mode
        },
    },
    "root": {
        "handlers": ["console", "file"],
        "level": "DEBUG",
    },
}

# Apply logging configuration
logging.config.dictConfig(LOGGING_CONFIG)
logger = logging.getLogger("fastapi_app")
