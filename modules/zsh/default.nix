{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    interactiveOnly =  true;
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };
}
