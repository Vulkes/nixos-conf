{
  config,
  pkgs,
  ...
}: {
  stylix.targets.alacritty.enable = false;
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    settings = {
      window = {
        opacity = 0.8;
      };
      mouse = {
        bindings = [
          {
            mouse = "Middle";
            action = "PasteSelection";
          }
        ];
      };
    };
  };
}
