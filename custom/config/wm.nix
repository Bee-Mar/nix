{ pkgs, config, ... }:

let
  wmPkgs = with pkgs; [
    brightnessctl
    playerctl
    qtile
    picom
    rofi
  ];
in
{
  services.xserver.windowManager.qtile.enable = true;

  users.users.bmarlowe = {
    packages = wmPkgs;
  };
}
