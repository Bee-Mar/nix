{ pkgs, ... }:

let
  workPkgs = with pkgs; [
    awscli2
    ssm-session-manager-plugin

    jetbrains.clion
  ];

in
{
  users.users.bmarlowe = {
    packages = workPkgs;
  };
}

