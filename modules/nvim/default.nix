{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./init.lua}
    '';

    configure.packages.myVimPackage.start = with pkgs.vimPlugins; [
      modus-themes-nvim
    ];
  };
}
