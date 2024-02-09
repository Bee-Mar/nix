# work/configuration.nix
{ config, pkgs, ... }:

let
  workPkgs = with pkgs; [
    awscli2
    ssm-session-manager-plugin

    jetbrains.clion
  ];

in
{
  users.users.${config.username} = {
    packages = workPkgs;
  };

  environment.systemPackages = with pkgs; [
    open-vm-tools
  ];

  services.xserver.videoDrivers = [ "vmware" ];

  virtualisation.vmware.guest.enable = true;
}

