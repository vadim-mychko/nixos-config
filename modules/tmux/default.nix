{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
      resurrect
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}
