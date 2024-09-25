{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    lua-language-server
    basedpyright
    ruff
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
      luasnip
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      lspkind-nvim
      harpoon2
      undotree
      auto-session
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./init.lua}
      EOF
    '';
  };
}
