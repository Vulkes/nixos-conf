{
  config,
  pkgs,
  ...
}: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        max_height = 80;
        sleep_timer = 30;
      };
      output = {
        channels = "mono";
        mono_option = "average";
        synchronized_sync = 1;
      };
    };
  };
}
