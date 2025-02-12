{ pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system and cinnamon
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };

  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    podman.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  environment.variables.PATH = "$PATH:$HOME/.config/nix/bin";
  environment.systemPackages = with pkgs;
    [
      vim
      git
      stdenv.cc.cc

      zip
      unzip

      wget
      curl

      firefox
      evince

      file
      tree
      rename

      alsa-utils

      calc

      killall
      htop

      devbox
      direnv

      libreoffice
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
