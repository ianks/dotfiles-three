#!/bin/bash

set -eou pipefail

dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
echo "Switching to the directory $dir..."
cd -P "$dir"

echo "Setting user and home flake variables to $USER and $HOME..."
echo "$HOME" > /tmp/.flake-var-home
echo "$USER" > /tmp/.flake-var-user

echo "Detecting the system..."

if [ "$(uname)" == "Darwin" ]; then
  echo "aarch64-darwin" > /tmp/.flake-var-system
elif [ "$(uname)" == "Linux" ]; then
  if [ "$(uname -m)" == "x86_64" ]; then
    echo "x86_64-linux" > /tmp/.flake-var-system
  elif [ "$(uname -m)" == "aarch64" ]; then
    echo "aarch64-linux" > /tmp/.flake-var-system
  else
    echo "Unsupported architecture: $(uname -m)"
    exit 1
  fi
fi
echo "System detected: $(cat /tmp/.flake-var-system)"
echo "Switching to the flake..."
nix run --impure home-manager/master -- -b bak switch --impure --flake .#dev
