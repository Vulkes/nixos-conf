{
  config,
  lib,
  pkgs,
  ...
}: {
  catppuccin = {
    enable = true;
    autoEnable = true;
    accent = "lavender";
    flavor = "mocha";
  };
}
