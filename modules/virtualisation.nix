{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  specialisation = {
    passthrough.configuration = {
      programs.virt-manager.enable = true;
      users.groups.libvirtd.members = ["yeff"];

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
      boot.kernelParams = [
        "amd_iommu=on"
        "vfio-pci.ids=1002:73df,1002:ab28"
      ];
    };
  };

  virtualisation.docker = {
    enable = true;
  };
  users.users.yeff.extraGroups = ["docker"];
}
