{ pkgs, ... }:
let
  utilityPkgs = with pkgs; [
    yq
    jq

    keychain

    tree
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
    texliveFull
  ];

  toolchainPkgs = with pkgs; [
    bun
    nodejs_20

    python311
    python311Packages.pip
    python311Packages.pipx
    python311Packages.grip
    python311Packages.argcomplete

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
  hardware.system76.enableAll = true;
  services.xserver.windowManager.qtile.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  users.users.bmarlowe = {
    extraGroups = [ "docker" ];
    packages = utilityPkgs ++ neovimPkgs ++ windowManagerPkgs ++ toolchainPkgs;
  };
}

