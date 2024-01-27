{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Home Manager configurations
    homeConfigurations = {
      "ianks@macbook" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./macbook/ianks.nix
          ./macbook/custom.nix
        ];
      };
      "ianks@devcontainer" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./devcontainer/ianks.nix
          ./devcontainer/custom.nix
        ];
      };
    };

    # Build a docker image for the devcontainer
    # ...
    devcontainerDockerImage = import ./devcontainer/docker.nix {
      inherit nixpkgs;
      inherit home-manager;
      inherit (home-manager.lib.homeManagerConfiguration."ianks@devcontainer") homeConfiguration;
    };
  };
}


