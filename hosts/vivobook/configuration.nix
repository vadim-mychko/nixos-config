{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  # ================================ PACKAGES =================================

  environment.systemPackages = with pkgs; [
    firefox
    vscode
    telegram-desktop
    foot
    zoxide
    fzf
    fd
    jq
    bat
    delta
    ripgrep
    lazygit
    htop
    btop
    tlrc
    eza
    wl-clipboard
    zathura
    fastfetch
    calibre
    qpdfview
    nnn
  ];

  # ================================= LOCALE ==================================

  time.timeZone = "Europe/Prague";
  i18n.defaultLocale = "en_GB.UTF-8";

 # ================================== FONTS ==================================

  fonts = {
    packages = with pkgs; [
      fira
      noto-fonts
      noto-fonts-color-emoji
      meslo-lgs-nf
    ];

    fontconfig.defaultFonts = {
      monospace = [ "Fira Mono" "MesloLGS NF" ];
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # ================================ PIPEWIRE =================================

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ============================= HARDWARE TWEAKS =============================
  #  CPU: Intel i7-12700H 12th Generation (Alder Lake)
  # iGPU: Intel Iris Xe Graphics
  #  GPU: Nvidia GeForce RTX 2050
  # ===========================================================================
  # https://nixos.wiki/wiki/Accelerated_Video_Playback
  # https://nixos.wiki/wiki/Intel_Graphics
  # https://nixos.wiki/wiki/Nvidia
  # https://github.com/NixOS/nixos-hardware/blob/master/common/gpu/intel/default.nix
  # https://wiki.archlinux.org/title/intel_graphics#Testing_the_new_experimental_Xe_driver
  # https://wiki.hyprland.org/Nvidia/#suspendwakeup-issues
  # ===========================================================================

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];

    enable32Bit = true;
    extraPackages32 = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # ============================== MISCELLANEOUS ==============================

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "vivobook";
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  users.users.mychkvad = {
    isNormalUser = true;
    description = "Vadim Mychko";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
