{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      user.name = "Vadim Mychko";
      user.email = "vadim_mychko@proton.me";
      init.defaultBranch = "main";
    };
  };
}
