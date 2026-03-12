{ config, pkgs, ... }:

{
  # imports = [ ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    hyfetch

    # archives
    zip
    unzip

    btop

    wineWowPackages.stable
    vscodium
    tmux
    bun
    ffmpeg-full
    playerctl  # CLI to control video playback
    obsidian
    discord
  ];
  
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      hi = "hyfetch";
      buildnix = "sudo nixos-rebuild switch";
    };
  };

  # Automatically reload systemd services TODO: Where do I put this
  systemd.user.startServices = "sd-switch";
}
