{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;

    config = {
      user.name = "Vadim Myckho";
      user.email = "vadim_mychko@proton.me";
      init.defaultBranch = "main";
    };
  };
}
