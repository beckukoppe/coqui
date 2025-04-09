#!/bin/bash

set -e

IMAGE_NAME="coqui-tts"
VOLUME_NAME="coqui_cache"

echo "🔧 Building Docker image..."
docker build -t $IMAGE_NAME .

echo "🗃️ Ensuring persistent volume exists..."
docker volume inspect $VOLUME_NAME >/dev/null 2>&1 || docker volume create $VOLUME_NAME

echo "✅ Setup complete: image '$IMAGE_NAME' and volume '$VOLUME_NAME' ready."
