{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = [ pkgs.zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    histSize = 10000;
    interactiveShellInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      ${builtins.readFile ./prompt.zsh}
      ${builtins.readFile ./aliases.zsh}
      ${builtins.readFile ./variables.zsh}
      ${builtins.readFile ./misc.zsh}
    '';
  };
}
