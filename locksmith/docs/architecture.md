# Architecture

```
Dev -> Git push
      | 
      v
  GitHub Actions / GitLab CI
      |-- Generate SBOM (Syft)
      |-- Scan CVE (Grype/Trivy)
      |-- Sign image + provenance (Cosign, SLSA)
      |-- Policy check (OPA/Rego)
      '--> Push image (ghcr.io / registry)
                    |
Deploy: K8s/Docker - Admission check (verify signature)
                    '--> Allowed? Run : Block
```

**Components**
- `app/` — sample FastAPI service to containerize.
- `ci/github-actions/build-sign-scan.yml` — CI workflow.
- `ci/policies/*.rego` — release gate rules.
- `scripts/` — helper scripts (verify signature locally, SBOM generation).
- `k8s/` — sample deployment and optional admission hook skeleton.
- `dashboard/` — starter configs for Prometheus/Grafana (simplified).
