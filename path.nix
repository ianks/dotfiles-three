{ pkgs, misc, ... }: {
  # Custom executables go here
  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.local/bin"
  ];
}
