#!/usr/bin/env bash

############################################################
# Starts SonarQube if not running and performs a sonar scan
# on the Web BFF service using Docker.
#
# Usage:
#   ./sonar-scan.sh
#
# Arguments:
#   None
#
# Example:
#   ./sonar-scan.sh
#
# Result:
#   - Ensures SonarQube container is running via Docker Compose
#   - Builds the Web BFF Docker image
#   - Runs unit tests and generate both test and coverage reports
#   - Executes SonarQube scan with unit test and coverage data generated in the previous step
############################################################

# Define the SonarQube container name
CONTAINER_NAME="smartfacility-sonarqube-1"

# Check if the SonarQube container is running
if docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" --quiet | grep -q .; then
  echo "SonarQube is already running."
else
  echo "SonarQube is not running. Starting SonarQube..."
  docker-compose -f $(PWD)/docker-compose-sonarqube.yml up -d
fi

echo "Building Web bff Docker image for sonar scan..."
docker build --progress=plain -t web-bff-dev -f ./web-bff/Dockerfile.dev ./web-bff

# Before running sonar-scan command we need to run coverage-report-xml because sonarqube needs coverage report (coverage.xml) from pytest 
echo "Running Web bff Docker container for sonar scan..."
docker run -p 8000:8000 --name web-bff-dev-container \
  --rm \
  --network smartfacility_sonarqube_network \
  -v $(PWD)/web-bff/app:/src/app \
  -v $(PWD)/web-bff/poetry.lock:/src/poetry.lock \
  -v $(PWD)/web-bff/pyproject.toml:/src/pyproject.toml \
  -v $(PWD)/web-bff/reports:/src/reports \
  -v $(PWD)/web-bff/tests:/src/tests \
  web-bff-dev \
  test

docker run \
  --rm \
  --network smartfacility_sonarqube_network \
  -v $(PWD)/web-bff/app:/src/app \
  -v $(PWD)/web-bff/poetry.lock:/src/poetry.lock \
  -v $(PWD)/web-bff/pyproject.toml:/src/pyproject.toml \
  -v $(PWD)/web-bff/reports:/src/reports \
  -v $(PWD)/web-bff/sonar-scanner.properties:/opt/sonar-scanner/conf/sonar-scanner.properties \
  -v $(PWD)/web-bff/tests:/src/tests \
  sonarsource/sonar-scanner-cli:11.3