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

    brave
    spotify

    kitty
    kitty-themes

    xsel
    keepassxc
    kpcli

    pandoc
    marp-cli
    texliveFull
    evince
    scrot
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
  ];

  neovimPkgs = with pkgs; [
    neovim

    nodePackages_latest.bash-language-server

    python311Packages.python-lsp-server
    python311Packages.pynvim
    python311Packages.black

    nerdfonts

    shfmt

    nixpkgs-fmt
    nil
  ];

  windowManagerPkgs = with pkgs; [
    python311Packages.qtile
    brightnessctl
    playerctl
    picom
    rofi
  ];
in
{
  services.xserver.windowManager.qtile.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  users.users.bmarlowe = {
    isNormalUser = true;
    description = "Brandon Marlowe";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    packages = utilityPkgs
      ++ neovimPkgs
      ++ windowManagerPkgs
      ++ toolchainPkgs;
  };
}

