{ config, pkgs, ... }:

{
  home = {
    username = "mychkvad";
    homeDirectory = "/home/mychkvad";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
