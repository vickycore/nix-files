{ lib, slskdDomain ? null, ... }:

{
  services.slskd = {
    enable = true;
    # ports: 5030 (HTTP) and 5031 (HTTPS)
    
    # openFirewall = true; # if I want to share P2P

    # TODO: Add env file or use sops-nix for secret management
  };
}
