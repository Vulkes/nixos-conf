{
  config,
  pkgs,
  inputs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
    users.yeff = {
      home = {
        username = "yeff";
        homeDirectory = "/home/yeff";

        stateVersion = "25.05";

        sessionVariables = {
          EDITOR = "nvim";
        };
      };

      xdg.userDirs = {
        enable = true;
        createDirectories = true;
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
