# Locksmith — Supply-Chain Security for CI/CD

**One-liner:** Secure your build pipeline: generate SBOM, scan CVEs, sign artifacts, enforce policy, and verify before deploy.

## Features
- SBOM generation (Syft) on each build
- Vulnerability scanning (Grype/Trivy) with policy thresholds
- Image signing + provenance (Cosign / Sigstore)
- Policy-as-code gate (OPA/Rego)
- Deploy-time verification (only signed images can run)
- Minimal dashboard (Prometheus + Grafana)

## Quick Start
1. Fork/clone this repo.
2. In GitHub, enable GitHub Container Registry (GHCR) for the repo.
3. Push to `main` to trigger CI (`.github/workflows/build-sign-scan.yml`).
4. See artifacts: SBOM attached to image, signature in Sigstore, and policy pass/fail.

## Local Demo
```bash
docker build -t locksmith-demo:local ./app
syft locksmith-demo:local -o spdx-json > sbom.spdx.json
grype locksmith-demo:local || true
cosign generate-key-pair # if you want key-based local signing
cosign sign --key cosign.key locksmith-demo:local
./scripts/local_verify.sh locksmith-demo:local
```

## Talking points (interview)
- SLSA-inspired provenance; tamper-evident pipeline
- Policy-as-code for auditable release gating
- Trade-offs: strict policy vs time-to-market (support exception labels)

