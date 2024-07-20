{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      user.name = "Vadim Mychko";
      user.email = "vadim_mychko@proton.me";
      init.defaultBranch = "main";
      diff.tool = "nvimdiff";
      difftool.prompt = "false";
    };
  };
}
