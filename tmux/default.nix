{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    baseIndex = 1;
    keyMode = "vi";
    shortcut = "a";
    escapeTime = 0;
    historyLimit = 10000;

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];

    extraConfigBeforePlugins = ''
      ${builtins.readFile ./before.conf}
    '';

    extraConfig = ''
      ${builtins.readFile ./after.conf}
    '';
  };
}
