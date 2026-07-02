{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    ''; # I'm too lazy to fix theming properly
    promptInit = ''
      fish_config prompt choose astronaut
    '';
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza";
      l = "${pkgs.eza}/bin/eza -lah";
      ll = "${pkgs.eza}/bin/eza -l";
      la = "${pkgs.eza}/bin/eza -a";
      lt = "${pkgs.eza}/bin/eza --tree";
      lla = "${pkgs.eza}/bin/eza -la";
      ":q" = "exit";
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/etc/nixos";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  environment.systemPackages = with pkgs; [
    eza
    fzf
    fishPlugins.done
    fishPlugins.fzf
    tlrc

    wget
    ffmpeg
    dust
    tree

    vim
    btop
  ];
}
