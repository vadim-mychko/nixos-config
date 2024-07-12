{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix

    ../../modules/gc.nix
    ../../modules/locale.nix
    ../../modules/fonts.nix
    ../../modules/pipewire.nix
    ../../modules/git.nix

    ../../modules/zsh
    ../../modules/sway
    ../../modules/nvim
    ../../modules/tmux
  ];

  environment.systemPackages = with pkgs; [
    firefox
    vscode
    telegram-desktop
    foot
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "vivobook";
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.mychkvad = {
    isNormalUser = true;
    description = "Vadim Mychko";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
