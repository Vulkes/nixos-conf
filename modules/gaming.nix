{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    steam-tui

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

    lumafly

    (retroarch.withCores (cores:
      with cores; [
        beetle-psx-hw
      ]))
    ryubing
  ];

  programs = {
    gamemode.enable = true;
    gamescope.enable = true;
  };

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
