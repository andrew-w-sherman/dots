{ config, pkgs, ... }:

{
  imports =
    [
      ./packages.nix
      ./ignore.nix
    ];

  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;
 
  # !!! Otherwise (even if you have a Raspberry Pi 2 or 3), pick this:
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # !!! Needed for the virtual console to work on the RPi 3, as the default of 16M doesn't seem to be enough.
  boot.kernelParams = ["cma=32M"];
    
  # File systems configuration for using the installer's partition layout
  fileSystems = {
  #  "/boot" = {
  #    device = "/dev/disk/by-label/NIXOS_BOOT";
  #    fsType = "vfat";
  #  };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };
    
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];  

  system.autoUpgrade.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.firmware = [
    (pkgs.stdenv.mkDerivation {
     name = "broadcom-rpi3-extra";
     src = pkgs.fetchurl {
     url = "https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/54bab3d/brcm80211/brcm/brcmfmac43430-sdio.txt";
     sha256 = "19bmdd7w0xzybfassn7x4rb30l70vynnw3c80nlapna2k57xwbw7";
     };
     phases = [ "installPhase" ];
     installPhase = ''
     mkdir -p $out/lib/firmware/brcm
     cp $src $out/lib/firmware/brcm/brcmfmac43430-sdio.txt
     '';
     })
  ];
  networking.wireless.enable = true;
  networking.hostName = "blart";
  #networking.networkmanager.enable = true;

  users.users.a =
    { isNormalUser = true;
      home = "/home/a";
      description = "Andrew";
      extraGroups = [ "wheel" "networkmanager" "power" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDebIgea8DrNWT+NaEW3r2RvoDoVzpzQ0/Eip1abVIHN+rYa1/WPvqZKPP2J/RhmWFQ4qU2lzSkfBw3raJSMihFUip1QyHaBMnt7/RX8778z4enAReEY20rMQPJy7OW5LBjrQ1JuQxBy6B56Exl9uTGu2WdrJGC87oLDlE41FndnGkapSrz96iusQID+Yw81mbbSUenVLAPKOXeLWx7PdOyy4eJV3dhdk5s5F0ZBPfYHY5y1Ui9nY8mAytWtm619LikNdcfdAdeB8UyDe0kAqS7vcQbJQv4EfRlkSR2Ickf3Y8MNqXqVCnuj9RBfjQe8+Bnra4K6Rf+xf8oLCX2F2c/ a@lambda" ];
    };

  services.sshd.enable = true;
  services.openssh.ports = [ 42069 ];

  services.ddclient = {
    enable = true;
    domains = [ "p.blart.info" ];
    interval = "30min";
    protocol = "googledomains";
  };

  services.plex = {
    enable = true;
    package = (import ./plex-arm.nix);
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  system.nixos.stateVersion = "18.03";
}
