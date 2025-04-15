#!/usr/bin/env bash

############################################################
# Builds and runs the Web Docker image for local development
# with live mounted source code and dependencies.
#
# Usage:
#   ./scripts/run-npm.sh [command]
#
# Arguments:
#   [command] - Optional command to run inside the container.
#               If not provided, it starts the default dev server.
#
# Example:
#   ./scripts/run-npm.sh run test
#
# Result:
#   - Builds the Docker image using Dockerfile.dev
#   - Mounts local source and config files into the container
#   - Starts the container for live development
############################################################

APP_DIR=web

echo "Building Web Docker image for development..."
docker build -t web-dev -f ./$APP_DIR/Dockerfile.dev ./web

echo "Running Web docker image for development..."
docker run -p 3000:3000 --name web-dev-container \
  -v $(PWD)/$APP_DIR/src:/app/src \
  -v $(PWD)/$APP_DIR/package-lock.json:/app/package-lock.json \
  -v $(PWD)/$APP_DIR/package.json:/app/package.json \
  --rm \
  web-dev \
  "$@"