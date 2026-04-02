{ config, pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # Default ports: 8096, 8920 (https://jellyfin.org/docs/general/post-install/networking/#port-bindings)
    dataDir = "/mnt/storage/jellyfin/data/";
    cacheDir = "/mnt/storage/jellyfin/cache/";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
