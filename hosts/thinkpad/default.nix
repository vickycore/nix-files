{ config, pkgs,  ... }:

{
  # Import NixOS modules
  imports =
    [ 
      ../../modules/base.nix
      ../../modules/display/i3.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Include external hard drive (Seagate 1TB USB)
      ./seagate.nix
    ];

  # TODO: Add GRUB
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname & networking
  networking.hostName = "chohept";
  networking.networkmanager.enable = true;

  # NixOS release version used for stateful data (IDK)
  system.stateVersion = "25.11";
}
