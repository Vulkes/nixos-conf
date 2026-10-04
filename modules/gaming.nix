{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    (heroic.override {
      extraPkgs = pkgs':
        with pkgs'; [
          gamescope
          gamemode
        ];
    })

    r2modman

    prismlauncher

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
    gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = false;
    };
  };

  programs.steam = {
    enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
