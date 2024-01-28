{ pkgs, config, ... }:

let
  wmPkgs = with pkgs; [
    brightnessctl
  ];
in
{
  services.xserver.windowManager.qtile.enable = true;

  users.users.bmarlowe = {
    packages = wmPkgs;
  };
}
