#!/bin/bash

set -e

IMAGE_NAME="coqui-tts"
TEXT="${1:-Hello from Coqui TTS in Docker!}"
OUT_FILE="output/tts.wav"

mkdir -p output

echo "🗣️ Synthesizing: \"$TEXT\""
docker run --rm -it \
  -v coqui_cache:/root/.local/share/tts \
  -v "$(pwd)/output":/app/output \
  $IMAGE_NAME \
  "tts --text '$TEXT' --model_name tts_models/en/ljspeech/vits--neon --out_path /app/$OUT_FILE"

echo "✅ Done. Output saved to: output/tts.wav"
