{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      user.name = "Vadim Mychko";
      user.email = "vadim_mychko@proton.me";
      init.defaultBranch = "main";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = "true";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      diff.tool = "nvimdiff";
      difftool.prompt = "false";
    };
  };
}
