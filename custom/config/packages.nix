{ pkgs, config, ... }:

let
  nvimPkgs = with pkgs; [
    neovim

    vimPlugins.vim-plug

    bun
    nodejs_20

    nodePackages_latest.bash-language-server

    python311Packages.build
    python311Packages.wheel
    python311Packages.setuptools
    python311Packages.setuptools-scm
    python311Packages.launchpadlib
    python311Packages.grip
    python311Packages.pyperclip
    python311Packages.pynvim
    python311Packages.python-lsp-server
    python311Packages.black
    python311Packages.argcomplete

    ruby_3_3
    rubyPackages_3_3.solargraph
    rubyPackages_3_3.yard

    shfmt

    texliveFull

    nerdfonts
  ];

  generalPkgs = with pkgs; [
    python311
    python311Packages.pip
    python311Packages.pipx

    clang_17
    clang-tools_17

    htop
    xsel

    yq
    jq
    rename

    killall

    cmake
    gnumake
    coreutils
    keychain

    tree
    silver-searcher
    fzf
    bat
    difftastic

    devbox

    nixpkgs-fmt

    brave
  ];

  workPkgs = with pkgs; [
    awscli
  ];

in
{
  users.users.bmarlowe = {
    packages = generalPkgs ++ nvimPkgs;
  };
}

