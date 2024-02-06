{ pkgs, ... }:
{
  virtualisation = {
    docker.enable = true;
    podman.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    git

    zip
    unzip

    wget
    curl
    firefox

    calc

    tree
    rename

    killall
    htop

    devbox
    direnv
  ];
}
