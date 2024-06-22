{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Vadim Mychko";
    userEmail = "vadim_mychko@proton.me";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };
}
