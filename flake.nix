{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    userSettings = {
      username = "mel";
    };
  in {
    nixosConfigurations = {
      yggdrasil = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
        modules = [
          inputs.nvf.nixosModules.default
          inputs.catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          hosts/yggdrasil/home.nix
          hosts/yggdrasil/configuration.nix
        ];
      };

      midgard = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
        modules = [
          inputs.nvf.nixosModules.default
          inputs.catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          hosts/midgard/home.nix
          hosts/midgard/configuration.nix
        ];
      };
    };
  };
}
