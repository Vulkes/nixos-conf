{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    git
    gnumake
    cmake
    hyperfine

    cargo
    rustc
    clippy
    rustfmt
    rust-analyzer
  ];
}
