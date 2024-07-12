{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      fira
      noto-fonts
      noto-fonts-color-emoji
      meslo-lgs-nf
    ];

    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      monospace = [ "Fira Mono" "MesloLGS NF" ];
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
