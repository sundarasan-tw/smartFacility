#!/usr/bin/env bash

############################################################
# This script performs dependency and Docker image vulnerability scans 
# using Trivy and generates HTML reports for both.
#
# Usage:
#   ./scripts/scan.sh
#
# Arguments:
#   None
#
# Example:
#   ./scripts/scan.sh
#
# Result:
#   - Scans for dependency vulnerabilities in the Web BFF app and generates 
#     an HTML report saved in 'web-bff/reports/trivy-dep/index.html'.
#   - Builds the production Docker image for the Web BFF app using Dockerfile.
#   - Scans the built Docker image for vulnerabilities and generates an HTML 
#     report saved in 'web-bff/reports/trivy-img/index.html'.
############################################################

# Scan for dependency vulnerabilities
mkdir -p web-bff/reports/trivy-dep
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(PWD)/.cache:/root/.cache/ \
  -v $(PWD)/web-bff/app:/src/app \
	-v $(PWD)/web-bff/tests:/src/tests \
  -v $(PWD)/web-bff/pyproject.toml:/src/pyproject.toml \
  -v $(PWD)/web-bff/poetry.lock:/src/poetry.lock \
  -v $(PWD)/web-bff/.trivyignore:/.trivyignore \
  -v $(PWD)/web-bff/trivy.yaml:/trivy.yaml \
  -v $(PWD)/web-bff/reports:/src/reports \
  aquasec/trivy:0.61.0 \
  fs \
  --output /src/reports/trivy-dep/index.html \
  /src

# Build production docker image
docker build -t web-bff -f ./web-bff/Dockerfile ./web-bff

# Scan production docker image
mkdir -p web-bff/reports/trivy-img
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(PWD)/.cache:/root/.cache/ \
  -v $(PWD)/web-bff/.trivyignore:/.trivyignore \
  -v $(PWD)/web-bff/trivy.yaml:/trivy.yaml \
  -v $(PWD)/web-bff/reports:/src/reports \
  aquasec/trivy:0.61.0 \
  image \
  --output /src/reports/trivy-img/index.html \
  web-bff