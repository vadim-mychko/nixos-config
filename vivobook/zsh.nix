{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh; 

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
    };
  };
}
