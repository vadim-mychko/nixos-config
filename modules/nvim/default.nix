{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pyright
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
