{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    heroic

    prismlauncher
    vintagestory
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
