{
  config,
  lib,
  pkgs,
  ...
}: {
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
