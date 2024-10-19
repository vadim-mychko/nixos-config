
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (import (builtins.fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/81610abc161d4021b29199aa464d6a1a521e0cc9.tar.gz";
      sha256 = "";
    }) { inherit system; }).calibre
  ];
}
