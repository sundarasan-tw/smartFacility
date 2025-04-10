#!/usr/bin/env bash

############################################################
# Builds and runs the Web BFF Docker image for development
# with live-mounted source code and test files.
#
# Usage:
#   ./run-web-bff-dev.sh [command]
#
# Arguments:
#   [command] - Optional command to run inside the container if nothing is passed it starts the web server in hot reload mode
#
# Example:
#   ./run-make.sh test
#
# Result:
#   - Builds the Docker image using Dockerfile.dev
#   - Runs the container with mounted volumes for live dev
############################################################

echo "Building Web bff Docker image for development..."
docker build --progress=plain -t web-bff-dev -f ./web-bff/Dockerfile.dev ./web-bff

echo "Running Web BFF docker image for development..."
docker run -p 8000:8000 --name web-bff-dev-container \
  -v $(PWD)/web-bff/app:/src/app \
  -v $(PWD)/web-bff/poetry.lock:/src/poetry.lock \
  -v $(PWD)/web-bff/pyproject.toml:/src/pyproject.toml \
  -v $(PWD)/web-bff/reports:/src/reports \
  -v $(PWD)/web-bff/tests:/src/tests \
  --rm \
  web-bff-dev \
  "$@"