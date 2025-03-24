FROM python:3.13-slim

WORKDIR /src

# Install make and other dependencies
RUN apt-get update && apt-get install -y make gcc curl && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY Makefile ./
COPY pyproject.toml poetry.lock ./
COPY app ./app
COPY tests ./tests

# Install dependencies using Makefile
RUN make setup-bff

# Run linting and formatting using Makefile
RUN make pre-commit-bff

# Run tests and coverage using Makefile
RUN make test-bff

# If everything passes, the image is ready
EXPOSE 8000

CMD ["make", "run-bff"]
