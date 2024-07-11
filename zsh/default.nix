{ ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
    initExtra = builtins.readFile ./prompt.sh;
  };
}
