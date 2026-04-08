{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    teams-for-linux
    nchat
    orca-slicer
  ];
}
