{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];

  fileSystems."/" ={
    device = "none";
    fsType = "tmpfs";
    neededForBoot = true;
  };

  fileSystems."/boot" ={
    device = "/dev/disk/by-uuid/B62B-6536";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/home" ={
    device = "/dev/disk/by-uuid/398c95e5-ca2a-4019-9e8e-bdbfcd4fad6b";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/nix" ={
    device = "/dev/disk/by-uuid/398c95e5-ca2a-4019-9e8e-bdbfcd4fad6b";
    fsType = "btrfs"; 
    options = [ "subvol=@nix" ];
    neededForBoot = true;
  };

  environment.persistence."/nix/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/log"
      "/etc/nixos"
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
