{
  config,
  pkgs,
  ...
}: {
  programs.cava = {
    enable = true;
    package = pkgs.cava.override {withSDL2 = true;};
    settings = {
      general = {
        max_height = 80;
        sleep_timer = 30;
      };
      output = {
        method = "sdl_glsl";
        channels = "mono";
        mono_option = "average";
        synchronized_sync = 1;
      };
    };
  };
}
