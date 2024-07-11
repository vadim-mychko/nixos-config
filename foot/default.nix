{ ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "bash";
        term = "foot";
        font = "Fira Mono:size=10, Noto Color Emoji:size=10";
        initial-window-mode = "maximized";
        dpi-aware = "yes";
      };

      cursor.color = "ffffff 7030af";
      colors = {
        foreground = "ffffff";
        background = "000000";
        selection-foreground = "ffffff";
        selection-background = "7030af";
        urls = "c6daff";

        regular0 = "000000";
        regular1 = "ff5f59";
        regular2 = "44bc44";
        regular3 = "d0bc00";
        regular4 = "2fafff";
        regular5 = "feacd0";
        regular6 = "00d3d0";
        regular7 = "ffffff";

        bright0 = "1e1e1e";
        bright1 = "ff5f5f";
        bright2 = "44df44";
        bright3 = "efef00";
        bright4 = "338fff";
        bright5 = "ff66ff";
        bright6 = "00eff0";
        bright7 = "989898";

        "16" = "fec43f";
        "17" = "ff9580";
      };
    };
  };
}
