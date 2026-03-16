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
      selection = {
        save_to_clipboard = true;
      };
    };
  };
}
