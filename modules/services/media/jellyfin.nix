{ config, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # Default ports: 8096, 8920 (https://jellyfin.org/docs/general/post-install/networking/#port-bindings)
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
