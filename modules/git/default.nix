{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      user.name = "Vadim Mychko";
      user.email = "vadim-mychko@proton.me";
      init.defaultBranch = "main";
      diff.tool = "nvimdiff";
      difftool.prompt = "false";

      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      delta = {
        navigate = true;
        "side-by-side" = true;
        "minus-style" = "syntax \"#ffbfbf\"";
        "minus-non-emph-style" = "syntax \"#ffbfbf\"";
        "minus-emph-style" = "syntax \"#ffbfbf\"";
        "minus-empty-line-marker-style" = "syntax \"#ffbfbf\"";
        "line-numbers-minus-style" = "#ffbfbf";
        "plus-style" = "syntax \"#a0e0a0\"";
        "plus-non-emph-style" = "syntax \"#a0e0a0\"";
        "plus-emph-style" = "syntax \"#a0e0a0\"";
        "plus-empty-line-marker-style" = "syntax \"#a0e0a0\"";
        "line-numbers-plus-style" = "#a0e0a0";
        "line-numbers-zero-style" = "#989898";
      };
    };
  };
}
