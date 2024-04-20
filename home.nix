{ config, pkgs, myPkgs, ... }:
let
  getVar = varName:
    pkgs.lib.removeSuffix "\n" (builtins.readFile /tmp/.flake-var-${varName});
in {
  home.username = getVar "user";
  home.homeDirectory = getVar "home";
  home.sessionVariables = {
    VISUAL = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
  # https://nixos.org/manual/nixos/unstable/release-notes#sec-release-24.05
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    git
    htop
    fzf
    ripgrep
    fd
    vscode
    just
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    gh
    direnv
    ripgrep
    bat
    nixfmt-classic
    starship
    unzip
    myPkgs.chruby
    myPkgs.ruby-build
  ];
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
