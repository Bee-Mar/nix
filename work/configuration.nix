{ pkgs, ... }:

let
  workPkgs = with pkgs; [
    awscli2
    ssm-session-manager-plugin

    jetbrains.clion
    vscode
  ];

in
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
  ];

  users.users.bmarlowe = {
    packages = workPkgs;
  };

  environment.systemPackages = with pkgs; [
    open-vm-tools
  ];

  services.xserver.videoDrivers = [ "vmware" ];

  virtualisation.vmware.guest.enable = true;
}

