# Nix Dotfiles

## Usage

Enable these experimental features in `nix.conf`:

```nix
experimental-features = nix-command flakes auto-allocate-uids
```

Then run:

```bash
$ nix run --impure home-manager/master -- -b bak switch --flake .#ianks@macbook
```

After you are done, you can roll back with:

```bash
$ nix run --impure home-manager/master -- -b bak switch --flake .#ianks@macbook --rollback
```
