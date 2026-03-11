# nix-files
config for desktop + servers
inspired by https://github.com/ryan4yin/nix-config/tree/main

structure:
```
flake.nix  # base flake
hosts/  # physical machines, servers
  laptop/
    default.nix
    hardware-configuration.nix
modules/
  nixos/
    services/  # system-level
      postgres.nix
      elasticsearch.nix
      redis.nix
      nextcloud.nix
      wireguard.nix
      grafana.nix
    profiles/
      base.nix
      monitoring.nix
  home/  # user-level
    shell.nix        # zsh/fish, aliases, starship
    git.nix
    editor.nix       # neovim config, plugins
    tools.nix        # ripgrep, fd, jq, bat, etc.
    ssh-client.nix   # ~/.ssh/config
home/  # user config
  yourname.nix       # imports from modules/home/*
```
