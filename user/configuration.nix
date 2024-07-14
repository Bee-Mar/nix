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

    python311Full
    python311Packages.pipx

    cmake
    cmake-format
    gnumake

    clang_17
    clang-tools_17

    jdk21
  ];

  editorPkgs = with pkgs; [
    neovim
    jetbrains.clion
    jetbrains.goland
  ];

  neovimPkgs = with pkgs; [
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
    windowManager = {
      i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          i3blocks
          feh
          playerctl
          picom
          rofi
          numlockx
          blueman
          brightnessctl
          acpi
        ];
      };
    };
  };

  programs = {
    nix-ld.enable = true;
    direnv.nix-direnv.enable = true;
  };

  nix.settings.experimental-features = "nix-command flakes";

  users.users.bmarlowe = {
    isNormalUser = true;
    description = "Brandon Marlowe";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    packages =
      utilityPkgs
      ++ neovimPkgs
      ++ editorPkgs
      ++ toolchainPkgs;
  };
}

