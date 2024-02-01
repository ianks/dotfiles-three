{
  description = "My personal NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      getVar = varName: nixpkgs.lib.removeSuffix "\n" (builtins.readFile /tmp/.flake-var-${varName});
    in
    {
      # Home Manager configurations
      homeConfigurations = {
        "dev" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${getVar "system"};
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home.nix
            ./path.nix
            ./shell.nix
            ./user.nix
            ./aliases.nix
            ./programs.nix
          ];
        };
      };
    };
}


