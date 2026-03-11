{ config, pkgs, ... }:

{
  # imports = [ ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "vicky";
    homeDirectory = "/home/vicky";
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

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Vicky Bala";
        email = "vikrambala.va@gmail.com";
      };
    };
  };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      hi = "hyfetch";
      buildnix = "sudo nixos-rebuild switch";
    };
  };

  # Automatically reload systemd services
  systemd.user.startServices = "sd-switch";

  # Read the wiki I have no clue what this does
  home.stateVersion = "25.11";
}
