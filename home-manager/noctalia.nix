{
  config,
  pkgs,
  inputs,
  ...
}: {
  # import the home manager module
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };
      wallpaper = {
        enabled = true;
        default.path = "${config.home.homeDirectory}/Pictures/walls/wallpaper.png";
      };
    };
  };
}
