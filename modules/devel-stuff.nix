{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    devenv
    gcc
    git
    rustup
    cargo
    gnumake
    cmake
    hyperfine
  ];
}
