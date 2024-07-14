{ pkgs, ... }:

{
  # ===========================================================================
  # [1] https://github.com/microsoft/pyright
  # [2] https://github.com/oxalica/nil
  # ===========================================================================

  environment.systemPackages = with pkgs; [
    pyright
    nil
  ];

  # ===========================================================================
  # [1] https://github.com/miikanissi/modus-themes.nvim
  # [2] https://github.com/neovim/nvim-lspconfig
  # [3] https://github.com/nvim-treesitter/nvim-treesitter
  # [4] https://github.com/nvim-telescope/telescope.nvim/
  # ===========================================================================

  programs.neovim = {
    enable = true;
    configure.packages.myVimPackage.start = with pkgs.vimPlugins; [
      modus-themes-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars

      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      telescope-nvim
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./modus.lua}
      ${builtins.readFile ./lsp.lua}
      ${builtins.readFile ./telescope.lua}
      EOF
    '';
  };
}
