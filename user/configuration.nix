# user/configuration.nix
{ pkgs, config, ... }:
let
  utilityPkgs = with pkgs; [
    yq
    jq

    silver-searcher
    fzf
    bat
    difftastic

    nixpkgs-fmt

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

    home-manager
  ];

  toolchainPkgs = with pkgs; [
    bun
    nodejs_20

    python311
    python311Packages.pipx
    python311Packages.grip
    python311Packages.argcomplete

    cmake
    cmake-format
    gnumake
    clang_17
    clang-tools_17
  ];

  neovimPkgs = with pkgs; [
    neovim

    vimPlugins.vim-plug

    nodePackages_latest.bash-language-server

    python311Packages.pynvim
    python311Packages.python-lsp-server
    python311Packages.black

    shfmt

    nerdfonts
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

