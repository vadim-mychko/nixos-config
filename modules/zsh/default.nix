{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = [ pkgs.zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
      strategy = [ "history" "completion" ];
      highlightStyle = "fg=15";
    };

    # 1. interactiveShellInit |
    # 2. shellAliases         |
    # 3. promptInit           v

    interactiveShellInit = ''
      ${builtins.readFile ./variables.zsh}
    '';

    shellAliases = builtins.readFile ./aliases.zsh;

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      ${builtins.readFile ./prompt.zsh}
    '';
  };
}
