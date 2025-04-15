#!/bin/bash

set -e

IMAGE_NAME="coqui-tts"


echo "🗣️ Running Docker container..."

docker run --rm \
  -v coqui_cache:/root/.local/share/tts \
  -p 5002:5002 \
  $IMAGE_NAME \
  "./start_server.sh"

echo "✅ Server exited."
