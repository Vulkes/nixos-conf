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
        inputs.noctalia.homeModules.default
        ../../home-manager/alacritty.nix
        ../../home-manager/rio.nix
        ../../home-manager/udisk.nix
        ../../home-manager/cava.nix
        ../../home-manager/noctalia.nix
        # ../../home-manager/steam.nix
      ];

      catppuccin = {
        enable = true;
        autoEnable = true;
        accent = "lavender";
        flavor = "mocha";
      };

      services.polkit-gnome.enable = true;
      xdg.configFile."niri/config.kdl".source = ../../home-manager/config/niri/yggdrasil.kdl;

      programs.home-manager.enable = true;

      home.packages = [
        kenku
      ];
    };
  };
}
