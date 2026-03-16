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
            esc = "capslock";
            "leftmeta+leftshift+f23" = "sysrq";
          };
          otherLayer = {};
        };
      };
    };
  };
}
