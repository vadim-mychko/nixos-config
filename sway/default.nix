{ ... }:

{
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export WLR_DRM_DEVICES="/dev/dri/card1"
    '';

    extraOptions = [ "--unsupported-gpu" ];
  };
}
