{
  description = "Base NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager,  ... } @ inputs: {
    nixosConfigurations = {
      chohept = nixpkgs.lib.nixosSystem {
        speicalArgs = {inherit inputs;};
        modules = [ ./nixos-config/configuration.nix ];
      };
    };

    homeConfigurations = {
      "vicky@cohhept" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [ ./home/home.nix ];
      };
    };
  };
}
