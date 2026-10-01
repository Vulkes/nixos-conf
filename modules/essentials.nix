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

  services.gvfs.enable = true;

  programs.firefox.enable = true;

  services.mullvad-vpn = {
    enable = true;
    gui.enable = true;
  };

  services.flatpak.enable = true;
  programs.winbox.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  environment.systemPackages = with pkgs; [
    (nemo-with-extensions.override {
      extensions = with pkgs; [nemo-preview nemo-seahorse];
    })
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
    orca-slicer

    ungoogled-chromium
    thunderbird
    qpwgraph
    easyeffects
    pwvucontrol
    networkmanagerapplet
  ];
}
