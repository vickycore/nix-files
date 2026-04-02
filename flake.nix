{
  description = "Base NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    spicetify-nix = {
      url = "github:jakeisnt/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable,  home-manager,  ... }: {
    # TODO: This setup bakes one user per host
    nixosConfigurations = {
      chohept = let
        username = "vicky";
        musicDir = "/mnt/storage/music";
        jellyfinRootDir = "/mnt/storage/jellyfin";

        specialArgs = {
          inherit username musicDir jellyfinRootDir;
        };        
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./hosts/thinkpad
            ./users/${username}/nixos.nix  # system-level packages for the user
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix; # user-level packages for the user
            }
          ];
        };
    };
  };
}
