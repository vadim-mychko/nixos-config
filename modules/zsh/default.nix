{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = [ pkgs.zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;

    autosuggestions = {
      enable = true;
      strategy = [ "completion" ];
      highlightStyle = "fg=15";
    };

    interactiveShellInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      ${builtins.readFile ./prompt.zsh}
    '';
  };
}
