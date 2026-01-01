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

    kitty
    ranger

    evince

    dive

    openvpn

    obsidian
  ];

  rePkgs = with pkgs; [
    gf
    gef

    ghidra
    burpsuite

    (cutter.withPlugins (ps: with ps; [
      rz-ghidra
    ]))
  ];

  toolchainPkgs = with pkgs; [
    bun
    nodejs_24

    (python313.withPackages (pythonPkgs: with pythonPkgs; [
      pipx
      pynvim
      ruff
    ]))

    cmake
    cmake-format
    gnumake

    #clang_19
    #clang-tools_19
    cling

    jdk25
  ];

  editorPkgs = with pkgs; [
    neovim
    tree-sitter
    jetbrains.clion
    jetbrains.goland
  ];

  neovimPkgs = with pkgs; [
    nodePackages_latest.bash-language-server

    lua-language-server

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

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

