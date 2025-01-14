{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      vivobook = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/vivobook/configuration.nix ];
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        python312
      ];
    };
  };
}
