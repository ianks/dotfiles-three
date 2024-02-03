devcontainer:
  @npx --yes @devcontainers/cli build --workspace-folder=. --platform=linux/amd64 --image-name=ianks/devcontainer
  @docker push ianks/devcontainer
