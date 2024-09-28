{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    nil
    lua-language-server
    basedpyright
    ruff
    clang-tools
    ltex-ls
    vale
  ];

  nixpkgs.overlays = [(final: prev: { neovim = prev.neovim.override {
    withPython3 = true;
    withRuby = false;
    withNodeJs = false;

    extraPython3Packages = ps: with ps; [
      pynvim
      jupyter-client
      cairosvg
      pnglatex
      plotly
      kaleido
      pyperclip
      nbformat
      pillow
    ];

    extraLuaPackages = ps: with ps; [
      magick
    ];

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
      lazygit-nvim
      conform-nvim
      nvim-lint
      gitsigns-nvim
      friendly-snippets
      telescope-ui-select-nvim
      trouble-nvim
      nvim-tree-lua
      dressing-nvim
      molten-nvim
      image-nvim
      otter-nvim
      quarto-nvim
      vim-slime
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./init.lua}
      EOF
    '';
  };})];
}
