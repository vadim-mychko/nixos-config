{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    configure.myVimPackage = with pkgs.vimPlugins; {
      start = [
        catppuccin-nvim
      ];
    };

    configure.customRC = ''
      lua << EOF
    '';
  };
}
