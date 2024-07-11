{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      modus-themes-nvim
    ];

    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
