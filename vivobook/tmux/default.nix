{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];

    extraConfigBeforePlugins = ''
      set -g @catppuccin_flavour 'mocha'
    '';
  };
}
