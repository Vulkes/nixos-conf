{
  config,
  lib,
  pkgs,
  ...
}: {
  options.desktop.niri.enable = lib.mkEnableOption "Enable Niri config";

  config = lib.mkIf config.desktop.niri.enable {
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;

    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.portal.config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
    };
  };
}
