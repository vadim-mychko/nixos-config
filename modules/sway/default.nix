{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export WLR_DRM_DEVICES="/dev/dri/card1"
    '';

    extraPackages = with pkgs; [
      swaylock
      swayidle
      dmenu
      wmenu
    ];

    extraOptions = [ "--unsupported-gpu" ];
  };
}
