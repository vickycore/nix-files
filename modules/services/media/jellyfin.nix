{ config, pkgs, username, jellyfinRootDir, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # Default ports: 8096, 8920 (https://jellyfin.org/docs/general/post-install/networking/#port-bindings)
    user = "${username}";  # external drive access
    dataDir = "${jellyfinRootDir}/data/";
    cacheDir = "${jellyfinRootDir}/cache/";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
