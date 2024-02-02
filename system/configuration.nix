{ pkgs, ... }:
{
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
    zip
    unzip
    calc
    tree
    rename
    killall
    htop
  ];
}
