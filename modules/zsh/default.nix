{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = [ pkgs.zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
    # interactiveShellInit = ''
    #   source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    #   ${builtin.readFile ./instant-prompt.sh}
    # ''; 

    # promptInit = builtin.readFile ./prompt.sh;
  };
}
