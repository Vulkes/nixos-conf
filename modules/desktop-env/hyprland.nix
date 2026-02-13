{
  config,
  lib,
  pkgs,
  ...
}: {
  options.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland config";

  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      psmisc
      hyprshot
      hyprpolkitagent
    ];
  };
}
