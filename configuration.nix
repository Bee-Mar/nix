{ lib, ... }:
{
  imports =
    [
      /etc/nixos/configuration.nix
      ./system/configuration.nix
      ./user/configuration.nix
    ]
    ++ lib.optional (builtins.pathExists ./work/configuration.nix) ./work/configuration.nix;
}
