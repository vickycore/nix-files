{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  
  };

  outputs = inputs@{ self, nixpkgs, home-manager,  ... }: {
    # Note the hostname
    nixosConfigurations.chohept = nixpkgs.lib.nixosSystem {
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix

        # Home Manager
        home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.vicky = import ./home.nix;

	    # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
	  }
      ];
    };
  };
}
