{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    configure.packages.myVimPackage.start = with pkgs.vimPlugins; [
      modus-themes-nvim
      nvim-treesitter.withAllGrammars
      telescope-nvim
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./mappings.lua}
      ${builtins.readFile ./theme.lua}
    '';
  };
}
