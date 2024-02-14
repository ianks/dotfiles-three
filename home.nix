{ config, pkgs, misc, ... }:
let
  getVar = varName:
    pkgs.lib.removeSuffix "\n" (builtins.readFile /tmp/.flake-var-${varName});
in {
  home.username = getVar "user";
  home.homeDirectory = getVar "home";
  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
  home.stateVersion =
    "22.11"; # https://nixos.org/manual/nixos/unstable/release-notes#sec-release-24.05
  home.packages = [
    pkgs.git
    pkgs.htop
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.vscode
    pkgs.just
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    pkgs.gh
    pkgs.direnv
    pkgs.ripgrep
    pkgs.bat
    pkgs.llvm
    pkgs.clang
    pkgs.libiconv
    pkgs.ruby_3_3
    pkgs.lldb
    pkgs.nixfmt
    pkgs.makeWrapper
    pkgs.pkg-config
    pkgs.gnumake
    pkgs.autoconf
    pkgs.automake
    pkgs.libtool
    pkgs.starship
    pkgs.unzip
  ];
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
