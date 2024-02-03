devcontainer-build:
  @npx --yes @devcontainers/cli build --workspace-folder=. --platform=linux/amd64 --image-name=ghcr.io/ianks/devcontainer

devcontainer-push:
  @docker push ianks/devcontainer
