{ config, pkgs, callPackage, ... }:

{
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager.defaultSession = "none+i3";

    windowManager.i3 = {
      package = pkgs.i3-rounded;
      enable = true;

      extraPackages = with pkgs; [
        rofi
        i3status
        polybar
        feh
        pywal
        networkmanager_dmenu
      ];
    };
  };
}
