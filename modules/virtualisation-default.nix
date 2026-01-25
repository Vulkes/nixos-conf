({
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.specialisation != {}) {
    boot.kernelParams = [
      "amd_iommu=on"
      "vfio-pci.ids=1002:13c0,1002:1640"
    ];
  };
})
