devcontainer:
  @npx --yes @devcontainers/cli build --workspace-folder=. --config=devcontainer.json --platform=linux/amd64 --image-name=ianks/devcontainer
  @docker push ianks/devcontainer
