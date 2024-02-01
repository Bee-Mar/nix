{ pkgs, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  users.users.bmarlowe = {
    extraGroups = [ "docker" ];
  };

  virtualisation = {
    docker.enable = true;
    podman.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    firefox
    git
  ];
}
