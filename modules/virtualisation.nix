{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["yeff"];
  users.users.yeff.extraGroups = ["docker"];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        vhostUserPackages = with pkgs; [virtiofsd];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
    "radeon"
  ];

  specialisation = {
    passthrough.configuration = {
      boot.kernelParams = [
        "amd_iommu=on"
        "vfio-pci.ids=1002:7550,1002:ab40"
      ];
    };
  };

  virtualisation.docker = {
    enable = true;
  };
}
