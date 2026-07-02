{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = "${pkgs.fish}/bin/fish";
      };
      window = {
        opacity = 0.8;
      };
      selection = {
        save_to_clipboard = true;
      };
    };
  };
}
