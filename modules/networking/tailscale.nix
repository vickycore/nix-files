{ config, pkgs, ... }:

{
  # Make tailscale usable for users
  environment.systemPackages = [ pkgs.tailscale ];

  # Enable service
  services.tailscale = {
    enable = true;
    # default port: 41641
  };
  
  # Enable firewall to allow traffic from Tailscale network & through port
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];

    # Only expose certain ports
    interfaces.tailscale0.allowedTCPPorts = [ 
      4533  # navidrome
      8096  # jellyfin (HTTP)
      8920  # jellyfin (HTTPS)
      8000  # vaultwarden
    ];
  };

  # Use nftables instead of iptables
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

  # Prevent systemd from waiting for network online
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
