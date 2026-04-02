{ ... }:

{
  services.vaultwarden = {
    enable = true;
    config = {
      # ROCKET_PORT = 8000;
      # ROCKET_ADDRESS = "0.0.0.0";
      # DOMAIN = "";  # Could use Tailscale MagicDNS here or serve from env variable?
      SIGNUPS_ALLOWED = false;
    };
  };
}
