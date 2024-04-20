# Nix Dotfiles

## Usage

Enable these experimental features in `~/.config/nix/nix.conf`:

```nix
experimental-features = nix-command flakes auto-allocate-uids
```

Then run:

```bash
$ ./install.sh
```

### Updating VSCode Extensions

VSCode extensions can be added in the UI, but to update the `vscode-extensions.nix` file, run:

```bash
./script/vscode-extgen | tee vscode-extensions.nix
```

### Building the devcontainer

There's a simple devcontainer in here with sshd installed. To build:

```bash
$ just devcontainer
```
