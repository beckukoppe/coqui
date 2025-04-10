#!/bin/bash

set -e

IMAGE_NAME="coqui-tts"
OUT_FILE="output/output.wav"

mkdir -p output

echo "🗣️ Running script.py inside Docker container..."

docker run --rm -it \
  -v coqui_cache:/root/.local/share/tts \
  -v "$(pwd)/output":/app/output \
  -v "$(pwd)/script.py":/app/script.py \
  $IMAGE_NAME \
  "python /app/script.py"

echo "✅ Done. Output saved to: $OUT_FILE"
