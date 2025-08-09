Locksmith adalah proyek demonstrasi Supply-Chain Security untuk pipeline CI/CD modern.
Proyek ini memitigasi risiko supply chain attack seperti dependency hijacking, malicious package injection, atau rilis tanpa verifikasi.

Pipeline ini memastikan setiap artefak:

Memiliki SBOM (Software Bill of Materials)

Dipindai dari known vulnerabilities (CVEs)

Ditandatangani menggunakan Sigstore Cosign (keyless signing atau key-based)

Diverifikasi sebelum dapat dideploy

Diblokir secara otomatis jika melanggar kebijakan keamanan

🎯 Features
SBOM Generation — Menggunakan Syft untuk dokumentasi komponen software

Vulnerability Scanning — Menggunakan Grype / Trivy

Image Signing & Provenance — Menggunakan Sigstore Cosign

Policy as Code — Dengan Open Policy Agent (OPA) untuk enforce rules

Deploy-time Verification — Hanya image bertanda tangan yang bisa berjalan

Dashboard Ringkas — Prometheus & Grafana untuk monitoring

🛠 Tech Stack
Area	Tools/Tech
CI/CD	GitHub Actions
Security	Syft, Grype, Trivy, Cosign (Sigstore)
Policy	Open Policy Agent (OPA/Rego)
Container	Docker, GHCR
Monitoring	Prometheus, Grafana
App Demo	FastAPI (Python)
