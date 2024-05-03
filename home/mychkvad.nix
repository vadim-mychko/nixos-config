{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
  ];

  home = {
    username = "mychkvad";
    homeDirectory = "/home/mychkvad";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
