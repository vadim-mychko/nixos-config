{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
  ];

  programs.neovim = {
    enable = true;
    configure.packages.myVimPackage.start = with pkgs.vimPlugins; [
      modus-themes-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      telescope-fzf-native-nvim
      nvim-web-devicons
      telescope-nvim
      lualine-nvim
      alpha-nvim
      vim-sleuth
      nvim-autopairs
      indent-blankline-nvim
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./init.lua}
      EOF
    '';
  };
}
