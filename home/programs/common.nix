{
  lib,
  pkgs,
  catppuccin-bat,
  ...
}: {
  home.packages = with pkgs; [
    hyfetch

    # archives
    zip
    unzip

    # utils
    ripgrep
    file
    exiftool    

    # misc
    wineWowPackages.wayland
    obsidian
    discord
    bun

    # IDE
    vscodium 
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
      themes = {
        # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
        catppuccin-mocha = {
          src = catppuccin-bat;
          file = "Catppuccin-mocha.tmTheme";
        };
      };
    };

    git.enable = true;
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    #jq.enable = true; # A lightweight and flexible command-line JSON processor
    #ssh.enable = true;

    #skim = {
    #  enable = true;
    #  enableZshIntegration = true;
    #  defaultCommand = "rg --files --hidden";
    #  changeDirWidgetOptions = [
    #    "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
    #    "--exact"
    #  ];
    #};
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
