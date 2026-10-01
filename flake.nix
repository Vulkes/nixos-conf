{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-25.11";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-old,
    ...
  }: let
    userSettings = {
      username = "mel";
    };
  in {
    nixosConfigurations = {
      yggdrasil = nixpkgs.lib.nixosSystem {
        specialArgs = let
          system = "x86_64-linux";
        in {
          inherit inputs;
          inherit userSettings;
          pkgs-old = import nixpkgs-old {
            inherit system;
          };
        };
        modules = [
          inputs.nvf.nixosModules.default
          inputs.catppuccin.nixosModules.catppuccin
          inputs.mangowm.nixosModules.mango
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
