{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    zsh-fzf-tab
  ];

  # ================================= SOURCES =================================
  # [1] https://youtu.be/ud7YxC33Z3w?si=0XJlozgWevORbcph
  # [2] https://stackoverflow.com/a/24237590
  # [3] https://unix.stackexchange.com/a/97844
  # ===========================================================================

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      ${builtins.readFile ./prompt.zsh}
      ${builtins.readFile ./aliases.zsh}
      ${builtins.readFile ./variables.zsh}
      ${builtins.readFile ./misc.zsh}
    '';
  };
}
