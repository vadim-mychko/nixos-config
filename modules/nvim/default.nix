{ pkgs, ... }:

let
  typst-preview-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "typst-preview.nvim";
    version = "2024-10-24";
    src = pkgs.fetchFromGitHub {
      owner = "chomosuke";
      repo = "typst-preview.nvim";
      rev = "06778d1b3d4d29c34f1faf80947b586f403689ba";
      sha256 = "oBJ+G4jTQw6+MF/SMwaTkGlLQuYLbaAFqJkexf45I1g=";
    };
  };

  neovim = pkgs.neovim.override {
    withPython3 = false;
    withRuby = false;
    withNodeJs = false;

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
      typst-preview-nvim
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./init.lua}
      EOF
    '';
  };
in {
  environment.systemPackages = with pkgs; [
    neovim
    nil
    lua-language-server
    basedpyright
    ruff
    clang-tools
    ltex-ls
    vale
    tinymist
    typstyle
    websocat
  ];
}
