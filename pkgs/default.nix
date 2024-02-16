{ pkgs }:

let
  chruby = import ./chruby.nix { inherit (pkgs) stdenv fetchurl; };
  ruby-build =
    import ./ruby-build.nix { inherit (pkgs) stdenvNoCC fetchurl makeWrapper; };
in {
  chruby = chruby;
  ruby-build = ruby-build;
}
