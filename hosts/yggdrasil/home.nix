{
  config,
  pkgs,
  userSettings,
  inputs,
  ...
}: {
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
        inputs.noctalia.homeModules.default
        ../../home-manager/alacritty.nix
        ../../home-manager/rio.nix
        ../../home-manager/udisk.nix
        ../../home-manager/cava.nix
        ../../home-manager/noctalia.nix
      ];

      services.polkit-gnome.enable = true;
      xdg.configFile."niri/config.kdl".source = ../../home-manager/config/niri/yggdrasil.kdl;

      programs.home-manager.enable = true;
    };
  };
}
