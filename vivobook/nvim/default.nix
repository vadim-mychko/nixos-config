{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    configure.myVimPackage = with pkgs.vimPlugins; {
      start = [

      ];
    };

    configure.customRC = ''
      lua << EOF
    '';
  };
}
