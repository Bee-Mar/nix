{ pkgs, ... }:
let
  utilityPkgs = with pkgs; [
    yq
    jq

    fzf
    fd
    bat
    difftastic
    silver-searcher
    stow

    brave
    spotify

    kitty
    kitty-themes

    xsel
    keepassxc
    kpcli
    scrot

    patchelf

    nix-index
    manix
  ];

  toolchainPkgs = with pkgs; [
    bun
    nodejs_20

    python311
    python311Packages.pipx

    cmake
    cmake-format
    gnumake

    clang_17
    clang-tools_17

    jdk21
  ];

  neovimPkgs = with pkgs; [
    neovim

    nodePackages_latest.bash-language-server

    python311Packages.pynvim
    python311Packages.black

    nerdfonts

    shfmt

    nixpkgs-fmt
    nil
  ];
in
{
  services.xserver = {
    desktopManager.xterm.enable = false;

    windowManager = {
      i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          i3blocks
          feh
          brightnessctl
          playerctl
          picom
          rofi
        ];
      };
    };
  };

  programs.nix-ld.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  users.users.bmarlowe = {
    isNormalUser = true;
    description = "Brandon Marlowe";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    packages =
      utilityPkgs
      ++ neovimPkgs
      ++ toolchainPkgs;
  };
}

