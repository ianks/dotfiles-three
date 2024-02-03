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

### Building the devcontainer

There's a simple devcontainer in here with sshd installed. To build:

```bash
$ just devcontainer
```