{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/957d95fc8b9bf1eb60d43f8d2eba352b71bbf2be.tar.gz";
      sha256 = "sha256:0jkxg1absqsdd1qq4jy70ccx4hia3ix891a59as95wacnsirffsk";
    }) { inherit system; }).wezterm
  ];
}
