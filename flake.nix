{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      vivobook = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/vivobook ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
