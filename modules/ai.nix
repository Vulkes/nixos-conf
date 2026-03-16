{
  config,
  lib,
  pkgs,
  ...
}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;

    loadModels = ["gemma3:12b" "deepseek-r1:8b" "ministral:8b"];
  };

  environment.systemPackages = with pkgs; [
    whisper-cpp-vulkan
  ];
}
