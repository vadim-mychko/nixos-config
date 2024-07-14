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
      nvim-treesitter.withAllGrammars
      telescope-nvim
      nvim-lspconfig
    ];

    configure.customRC = ''
      lua << EOF
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./mappings.lua}
      ${builtins.readFile ./theme.lua}
      ${builtins.readFile ./lsp.lua}
    '';
  };
}
