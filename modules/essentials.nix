{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./essentials/shell.nix
    ./essentials/fonts.nix
    ./essentials/kbm.nix
  ];

  services.udisks2.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.fwupd.enable = true;

  programs.firefox.enable = true;

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    nemo-fileroller
    nemo-preview
    file-roller
    mpv
    xed-editor
    xviewer
    xreader
    libreoffice
    transmission_4-gtk
    gparted
    spotify-player
    spotify
    vesktop
    krita
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    ungoogled-chromium
    thunderbird
    qpwgraph
    easyeffects
    pwvucontrol
    networkmanagerapplet
  ];
}
