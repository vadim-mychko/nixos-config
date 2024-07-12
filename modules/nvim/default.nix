{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./init.lua}
    '';

    configure.packages.myVimPackage.start = with pkgs.vimPlugins; [
      modus-themes-nvim
    ];
  };
}
