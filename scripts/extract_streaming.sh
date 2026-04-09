#!/bin/bash
# Usage: ./scripts/extract_streaming.sh <proto_package> <output_file>
# Example: ./scripts/extract_streaming.sh google.firestore.v1 /tmp/streaming.json
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PACKAGE=$1
OUTPUT=$2

IMAGE_FILE="/tmp/googleapis-image.json"
if [ ! -f "$IMAGE_FILE" ]; then
  (
    cd "$REPO_ROOT/googleapis"
    buf build . --exclude-path preview --output json -o "$IMAGE_FILE"
  )
fi

jq --arg pkg "$PACKAGE" '
  [.file[]
   | select(.package == $pkg)
   | .service[]?.method[]?
   | select(.serverStreaming == true)
   | .name
  ]' "$IMAGE_FILE" > "$OUTPUT"
