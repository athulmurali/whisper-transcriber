#!/bin/bash

set -e

MODEL="large"  # This is the only change you need

if [[ -z "$1" ]]; then
  echo "❌ Usage: docker run -v \$(pwd):/app whisper-transcriber /app/path/to/file.m4a"
  exit 1
fi

AUDIO_FILE="$1"

if [[ ! -f "$AUDIO_FILE" ]]; then
  echo "❌ File does not exist: $AUDIO_FILE"
  exit 1
fi

echo "🎧 Transcribing: $(basename "$AUDIO_FILE") using model=$MODEL"
whisper "$AUDIO_FILE" --model "$MODEL" --language en --output_dir "$(dirname "$AUDIO_FILE")"
echo "✅ Done. Output saved to: $(dirname "$AUDIO_FILE")"
