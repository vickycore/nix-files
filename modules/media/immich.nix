{ config, lib, imgDir, ... }:

{
  services.immich = {
    enable = true;
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;

    services.immich.machine-learning.enable = lib.mkDefault true;
  };
}
