setup:
	@echo "Setting up Web bff app..."
	@if ! command -v poetry &> /dev/null; then \
		echo "Poetry not found. Installing poetry..."; \
		curl -sSL https://install.python-poetry.org | python3 -; \
		ln -s $$HOME/.local/bin/poetry /usr/local/bin/poetry; \
		poetry config virtualenvs.create true; \
		poetry lock; \
		poetry install --no-root; \
	else \
		echo "Poetry exists. Installing dependencies..."; \
		poetry install --no-root; \
	fi

run:
	@poetry run uvicorn app.main:app --host 0.0.0.0 $(if $(port),--port $(port)) --reload

test-report:
	@poetry run pytest --asyncio-mode=auto --cov=app --cov-report=html:coverage-reports --html="test-reports/test_report.html" --self-contained-html tests/

test:
	@poetry run pytest --asyncio-mode=auto --cov=app tests/

poetry-add:
	@poetry add $(package)
	@poetry lock


# pre-commit:
# 	@echo "Running pre-commit tasks (lint fix and format)..."
# 	@poetry run ruff check --fix .
# 	@poetry run ruff format .

# test:
# 	@echo "Running Web bff tests with coverage..."
# 	@poetry run pytest --asyncio-mode=auto --cov=app tests/

# set-pre-commit-hook:
# 	@echo "Setting up pre-commit hook in your git repository..."
# 	poetry add pre-commit
# 	poetry run pre-commit install

# docker-build:
# 	@echo "Building Web bff Docker image..."
# 	docker build -t web -f docker/web.Dockerfile .

# docker-run: docker-build
# 	@echo "Running Web bff Docker container..."
# 	@docker run -p 8000:8000 web

# docker-test: docker-build
# 	@echo "Running Web bff tests in Docker..."
