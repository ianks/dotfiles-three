image_name := "ghcr.io/ianks/devcontainer"
devcontainer_cli_version := "0.56.1"

devcontainer-build:
  @npx --yes @devcontainers/cli@{{devcontainer_cli_version}} build --workspace-folder=. --platform=linux/amd64 --image-name={{image_name}}

devcontainer-push:
  @docker push {{image_name}}
