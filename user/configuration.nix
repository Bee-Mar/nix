{ config, pkgs, ... }:
let
  utilityPkgs = with pkgs; [
    yq
    jq

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
    marp-cli
    texliveFull
  ];

  toolchainPkgs = with pkgs; [
    devbox

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

  isSystem76 =
    let
      sysVendor = builtins.readFile "/sys/class/dmi/id/sys_vendor";
    in
    pkgs.lib.strings.hasPrefix "System76" sysVendor;
in
{
  hardware.system76.enableAll = isSystem76;
  services.xserver.windowManager.qtile.enable = true;

  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.auto-optimise-store = true;

  users.users.bmarlowe = {
    extraGroups = [ "docker" ];

    packages = utilityPkgs
      ++ neovimPkgs
      ++ windowManagerPkgs
      ++ toolchainPkgs;
  };
}

