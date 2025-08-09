package image

# Example policy: only allow images from ghcr.io/<org> registry
valid_registry {
  startswith(input.image, "ghcr.io/")
}
