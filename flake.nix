{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    python = pkgs.python312.withPackages (ps: with ps; [
      ipykernel
      numpy
      matplotlib
      scipy
    ]);
  in {
    nixosConfigurations = {
      vivobook = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/vivobook/configuration.nix ];
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = [
        python
      ];
    };
  };
}
