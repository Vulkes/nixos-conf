{
  config,
  lib,
  pkgs,
  ...
}: {
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.niri.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
  };

  services.displayManager.ly.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rio
    alacritty
    libnotify
    bibata-cursors
    fastfetch
    playerctl
    mint-themes
    mint-y-icons
    nwg-look
    xwayland-satellite
  ];
}
