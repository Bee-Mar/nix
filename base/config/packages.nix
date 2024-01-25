{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    firefox
    git
  ];
}
