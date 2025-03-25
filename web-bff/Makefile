install-poetry:
	@echo "Checking if Poetry is installed..."
	@if ! command -v poetry &> /dev/null; then \
		echo "Poetry not found. Installing poetry..."; \
		curl -sSL https://install.python-poetry.org | python3 -; \
		ln -s $$HOME/.local/bin/poetry /usr/local/bin/poetry; \
	else \
		echo "Poetry is already installed."; \
	fi

setup-bff:
	@$(MAKE) install-poetry
	@echo "Setting up Web bff app..."
	poetry config virtualenvs.create true
	poetry install --no-root

run-bff:
	@$(MAKE) setup-bff
	@poetry run uvicorn app.main:app --host $${HOST:-127.0.0.1} --port $${PORT:-8000} --reload

pre-commit-bff:
	@echo "Running pre-commit tasks (lint fix and format)..."
	@poetry run ruff check --fix .
	@poetry run ruff format .

test-bff:
	@echo "Running Web bff tests with coverage..."
	@poetry run pytest --asyncio-mode=auto --cov=app tests/

set-pre-commit-hook-bff:
	@echo "Setting up pre-commit hook in your git repository..."
	poetry add pre-commit
	poetry run pre-commit install