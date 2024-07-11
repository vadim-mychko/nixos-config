{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = builtins.readFile ./gitconfig;
  };
}
