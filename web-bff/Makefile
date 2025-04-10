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

# Default argument value for "test-out"
test-out=reports

test:
	@poetry run pytest \
		--asyncio-mode=auto \
		--tb=short \
		--maxfail=9999 \
		--html="${test-out}/test/index.html" \
		--self-contained-html \
		--junitxml=${test-out}/test.xml \
		--disable-warnings \
		--capture=no \
		--cov=app \
		--cov-report term \
		--cov-report=html:${test-out}/coverage \
		--cov-report=xml:${test-out}/coverage.xml \
		tests/

	# Deleting .gitignore file that is generated as part of coverage HTML report
	# because it prevents the coverage report from being uploaded to Github Pages
	rm ${test-out}/coverage/.gitignore

poetry-add:
	@poetry add $(package)
	@poetry lock

# In local dev environment fix lint/format issues if found
check:
	@echo "Linting..."
	@poetry run ruff check --fix .
	@echo "Linting done.\nNow formatting..."
	@poetry run ruff format .

# In CI run DO NOT fix lint/format issues instead just report them
ci-check:
	@echo "Linting..."
	@poetry run ruff check .
	@echo "Linting done.\nNow formatting..."
	@poetry run ruff format --check .
sonar-scan:
	@echo "Running SonarQube scanner..."
	@poetry run pysonar-scanner -Dproject.settings=sonar-scanner.properties

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
