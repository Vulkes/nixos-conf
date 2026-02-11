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

    (prismlauncher.override {
      jdks = [
        zulu25
        zulu21
        zulu17
        zulu8
      ];
    })
    vintagestory
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
