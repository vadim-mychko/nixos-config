{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      user.name = "Vadim Mychko";
      user.email = "vadim_mychko@proton.me";
      init.defaultBranch = "main";
      core.pager = "less -+F -+X";
      diff.tool = "nvimdiff";
      difftool.prompt = "false";
    };
  };
}
