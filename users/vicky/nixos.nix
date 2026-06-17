{
  imports = [
    # Add system-level modules here
    ../../modules/media/immich.nix  # image server
    ../../modules/media/jellyfin.nix  # video server
    ../../modules/media/navidrome.nix  # music server
    ../../modules/networking/tailscale.nix 
  ];

  # SSH public key
  users.users.vicky = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAzx20jRavuXo9ozWHDJT5gjswqn7Eldxa0Dk+KJ6RGy vicky@chohept"
    ];
  };
}
