{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    configure.packages.myVimPackage.start = with pkgs.vimPlugins; [
      modus-themes-nvim
      nvim-treesitter.withAllGrammars
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./theme.lua}
    '';
  };
}
