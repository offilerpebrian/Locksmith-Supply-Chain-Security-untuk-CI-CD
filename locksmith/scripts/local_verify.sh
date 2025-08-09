#!/usr/bin/env bash
set -euo pipefail
IMAGE="${1:-}"
if [ -z "$IMAGE" ]; then
  echo "Usage: ./local_verify.sh <image-ref>"
  exit 1
fi
cosign verify "$IMAGE" >/dev/null
echo "[OK] Signature verified for $IMAGE"
