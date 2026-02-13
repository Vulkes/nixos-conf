{
  config,
  lib,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    opacity.terminal = 0.8;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
