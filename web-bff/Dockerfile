FROM python:3.13-slim

WORKDIR /src

# Install make, gcc, and curl with specific versions
RUN apt-get update && apt-get install -y \
    make=4.3-4 \
    gcc=4:12.2.0-14 \
    curl=7.88.1-10+deb12u1 \
    && rm -rf /var/lib/apt/lists/*

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
