{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    zsh-fzf-tab
  ];

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      ${builtins.readFile ./p10k.zsh}
      ${builtins.readFile ./zshrc}
    '';
  };
}
