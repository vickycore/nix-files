# nix-files
config for desktop + servers, inspired by https://github.com/ryan4yin/nix-config/tree/main

File structure explained:
```
flake.nix  # base flake
hosts/  # physical machines, servers
  thinkpad/  # my trusty T480
    default.nix
    hardware-configuration.nix
modules/
  base/ # system-level configs
  ...
home/  # users
  vicky.nix
```
