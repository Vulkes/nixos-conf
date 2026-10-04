{
  config,
  lib,
  pkgs,
  ...
}: {
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.desktopManager.cosmic.enable = true;
  programs.mango.enable = true;

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    libnotify
    bibata-cursors
    fastfetch
    playerctl
  ];
}
