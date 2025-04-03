#!/usr/bin/env bash

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
	-v $(PWD)/web-bff/tests:/src/tests \
	-v $(PWD)/web-bff/reports:/src/reports \
  -v $(PWD)/web-bff/pyproject.toml:/src/pyproject.toml \
  -v $(PWD)/web-bff/poetry.lock:/src/poetry.lock \
	web-bff-dev \
  test-report-xml

docker run \
    --rm \
    --network smartfacility_sonarqube_network \
    -v $(PWD)/web-bff/app:/src/app \
	  -v $(PWD)/web-bff/tests:/src/tests \
    -v $(PWD)/web-bff/reports:/src/reports \
    -v $(PWD)/web-bff/pyproject.toml:/src/pyproject.toml \
    -v $(PWD)/web-bff/poetry.lock:/src/poetry.lock \
    -v $(PWD)/web-bff/sonar-scanner.properties:/opt/sonar-scanner/conf/sonar-scanner.properties \
    sonarsource/sonar-scanner-cli:11.3