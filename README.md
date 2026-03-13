# nix-files
config for desktop + servers, 
HEAVILY borrows from inspired by https://github.com/ryan4yin/nix-config/tree/i3-kickstarter

## File structure
```
flake.nix  # base flake

hosts/  # physical machines, server config
  thinkpad/  # my trusty T480
  nas/ # Home Lab (coming soon)

modules/ System packages (organized by function)

home/  # Home Manager packages (organized by function)

users/ # user config (e.g. configuring Git)
```
