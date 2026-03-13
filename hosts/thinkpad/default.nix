{ config, pkgs,  ... }:

{
  # Import NixOS modules
  imports =
    [ 
      ../../modules/i3.nix
      ../../modules/base.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
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
