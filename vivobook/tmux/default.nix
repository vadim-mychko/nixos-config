{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    baseIndex = 1;
    keyMode = "vi";

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
