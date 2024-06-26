{
  description = "My personal NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      getVar = varName:
        nixpkgs.lib.removeSuffix "\n"
        (builtins.readFile /tmp/.flake-var-${varName});
    in {
      home-manger.backupFileExtension = "nix-bak";

      homeConfigurations = {
        "dev" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${getVar "system"};
          extraSpecialArgs = {
            inherit inputs;

            myPkgs = import ./pkgs/default.nix {
              pkgs = nixpkgs.legacyPackages.${getVar "system"};
            };
          };
          modules = [
            ./home.nix
            ./path.nix
            ./shell.nix
            ./user.nix
            ./aliases.nix
            ./programs.nix
            ./vscode.nix
            ./vscode-extensions.nix
            ./rust.nix
          ];
        };
      };
    };
}
