#!/bin/bash

set -eou pipefail

dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
echo "Switching to the directory $dir..."
cd -P "$dir"

echo "Setting user and home flake variables to $USER and $HOME..."
echo "$HOME" > /tmp/.flake-var-home
echo "$USER" > /tmp/.flake-var-user

echo "Switching to the flake..."
nix run --impure home-manager/master -- -b bak switch --impure --flake .#dev
