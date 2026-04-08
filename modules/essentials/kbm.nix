{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    solaar
    logitech-udev-rules
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            "leftmeta+leftshift+f23" = "sysrq";
          };
          otherLayer = {};
        };
      };
    };
  };
}
