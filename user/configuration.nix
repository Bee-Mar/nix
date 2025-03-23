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

    pinta

    nix-index
    manix

    kitty
    ranger

    evince
    okular

    gimp

    openvpn

    obsidian

    libtool
    libvterm
    emacs
  ];

  rePkgs = with pkgs; [
    gf
    gef

    ghidra
    ida-free
    burpsuite

    (cutter.withPlugins (ps: with ps; [
      rz-ghidra
    ]))
  ];

  toolchainPkgs = with pkgs; [
    bun
    nodejs_22

    (python313.withPackages (pythonPkgs: with pythonPkgs; [
      pipx
      pynvim
      ruff
    ]))

    ruff-lsp

    cmake
    cmake-format
    gnumake

    clang_19
    clang-tools_19
    cling

    jdk23
  ];

  editorPkgs = with pkgs; [
    neovim
    vscode
    jetbrains.clion
    jetbrains.goland
  ];

  neovimPkgs = with pkgs; [
    nodePackages_latest.bash-language-server

    lua-language-server

    nerdfonts

    shfmt

    nixpkgs-fmt
    nil

    usbimager # just for future ref
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
    #steam.enable = true;
  };

  nix.settings.experimental-features = "nix-command flakes";

  virtualisation = {
    vmware.host.enable = true;
  };

  users.users.bmarlowe = {
    isNormalUser = true;
    description = "Brandon Marlowe";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    packages =
      utilityPkgs
      ++ neovimPkgs
      ++ editorPkgs
      ++ rePkgs
      ++ toolchainPkgs;
  };
}

