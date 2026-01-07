{
  config,
  lib,
  pkgs,
  ...
}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;

    # acceleration = "rocm";
    # environmentVariables = {
    # HCC_AMDGPU_TARGET = "gfx1031";
    # };
    # rocmOverrideGfx = "10.3.0";

    loadModels = ["gemma3:12b" "deepseek-r1:8b" "ministral:8b"];
  };

  services.open-webui = {
    port = 8081;
    enable = true;
  };
}
