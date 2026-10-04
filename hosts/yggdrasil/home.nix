{
  config,
  pkgs,
  userSettings,
  inputs,
  ...
}: let
  kenku = pkgs.callPackage ../../home-manager/kenku-fm.nix {inherit pkgs;};
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
    users."${userSettings.username}" = {
      home = {
        inherit (userSettings) username;
        homeDirectory = "/home/${userSettings.username}";

        stateVersion = "25.05";

        sessionVariables = {
          EDITOR = "nvim";
        };
      };

      xdg.userDirs = {
        enable = true;
        createDirectories = true;
      };

      dconf = {
        settings = {
          "org/cinnamon/desktop/applications/terminal" = {
            exec = "alacritty";
          };
        };
      };

      imports = [
        inputs.catppuccin.homeModules.catppuccin
        inputs.mangowm.hmModules.mango
        ../../home-manager/alacritty.nix
        ../../home-manager/udisk.nix
        ../../home-manager/mango.nix
      ];

      programs.noctalia = {
        enable = true;
        settings = ../../home-manager/noctalia.toml;
      };

      catppuccin = {
        enable = true;
        autoEnable = true;
        accent = "lavender";
        flavor = "mocha";
      };

      programs.home-manager.enable = true;

      home.packages = [
        kenku
      ];
    };
  };
}
