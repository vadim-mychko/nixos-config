{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
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
