{
  config,
  pkgs,
  inputs,
  stylix,
  ...
}: {
  # import the home manager module
  stylix.targets.noctalia-shell.enable = false;
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        exclusive = false;
      };
      wallpaper = {
        directory = "${config.home.homeDirectory}/Pictures/walls";
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Catppuccin";
        darkmode = true;
      };
    };
  };
}
