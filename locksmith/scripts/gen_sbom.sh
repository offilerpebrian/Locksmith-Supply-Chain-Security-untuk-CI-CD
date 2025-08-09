#!/usr/bin/env bash
set -euo pipefail
IMAGE="${1:-locksmith-demo:local}"
syft "$IMAGE" -o spdx-json > sbom.spdx.json
echo "[OK] SBOM written to sbom.spdx.json"
