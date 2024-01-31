{ pkgs, ... }:

{
  users.users.bmarlowe = {
    extraGroups = [ "docker" ];
  };

  virtualisation = {
    docker.enable = true;
    podman.enable = true;
  };
}

