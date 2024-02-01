{ lib, ... }:
{
  imports =
    [ ./base/configuration.nix ]
    ++ lib.optional (builtins.pathExists ./custom/configuration.nix) ./custom/configuration.nix
    ++ lib.optional (builtins.pathExists ./work/configuration.nix) ./work/configuration.nix;
}
