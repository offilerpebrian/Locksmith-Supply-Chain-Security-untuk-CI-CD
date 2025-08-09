# Placeholder for an admission webhook verifier.
# In production you would implement a small service that:
# 1) Receives AdmissionReview
# 2) Extracts image reference
# 3) Runs `cosign verify` against the image
# 4) Returns allowed=true/false
