{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh; 

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
    promptInit = ''
      ${builtins.readFile ./.zshrc}
    '';
  };
}
