{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [

    ];

    configure.customRC = ''
      lua << EOF
    '';
  };
}
