{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [

    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}
