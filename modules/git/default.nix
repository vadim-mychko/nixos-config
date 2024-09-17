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

      core.pager = "delta --paging=always";
      interactive.diffFilter = "delta --color-only --diff-so-fancy";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      delta = {
        navigate = true;
        "side-by-side" = true;
      };
    };
  };
}
