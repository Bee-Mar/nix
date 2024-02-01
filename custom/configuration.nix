{ pkgs, ... }:

let
  #customNeovim = pkgs.stdenv.mkDerivation {
  #name = "neovim-with-vim-plug";
  #  buildInputs = [ pkgs.neovim ];
  #
  #  unpackPhase = "true"; # No need to unpack anything
  #
  #  installPhase = ''
  #    mkdir -p $out/share/nvim/site/autoload
  #    curl -fLo $out/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  #  '';
  #
  #  preferLocalBuild = true;
  #  allowSubstitutes = false;
  #  };

  nvimPkgs = with pkgs; [
    #customNeovim

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
    nil
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
    spotify

    zip
    unzip

    kitty

    calc

    keepassxc
    kpcli

    pandoc
  ];

  wmPkgs = with pkgs; [
    brightnessctl
    playerctl
    qtile
    picom
    rofi
  ];

in
{
  hardware.system76.enableAll = true;
  services.xserver.windowManager.qtile.enable = true;

  users.users.bmarlowe = {
    packages = generalPkgs ++ nvimPkgs ++ wmPkgs;
  };
}

