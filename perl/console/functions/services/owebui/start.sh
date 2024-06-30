#!/bin/bash

# Run the Docker container with the specified settings
docker run -d \
  -p 3000:8080 \
  -e OLLAMA_BASE_URL=http://172.23.207.28:11434/ \
  -v open-webui:/app/backend/data \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main
