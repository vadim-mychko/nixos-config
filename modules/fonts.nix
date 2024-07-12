{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      fira
      noto-fonts
      noto-fonts-color-emoji
    ];

    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      monospace = [ "Fira Mono" ];
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
