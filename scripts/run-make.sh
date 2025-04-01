#!/usr/bin/env bash
echo "Building Web bff Docker image for development..."
docker build --progress=plain -t web-bff-dev -f ./web-bff/Dockerfile.dev ./web-bff

echo "Running Web bff Docker container for test and coverage reports..."
docker run -p 8000:8000 --name web-bff-dev-container \
	-v $(PWD)/web-bff/app:/src/app \
	-v $(PWD)/web-bff/tests:/src/tests \
	-v $(PWD)/web-bff/reports:/src/reports \
	--rm \
	web-bff-dev \
  "$@"
