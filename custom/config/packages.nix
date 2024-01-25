{ pkgs, config, ... }:

let
	nvimPkgs = with pkgs; [
		neovim

		vimPlugins.vim-plug

		clang_17
		clang-tools_17

		gcc13
		
		bun
		nodejs_20

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

		htop
		xsel

		yq
		jq
		rename
		
		killall

		cmake
		gnumake
		coreutils

		tree
		silver-searcher
		fzf
		bat
		difftastic
		
		devbox
	];

	workPkgs = with pkgs; [
		awscli
	];

in {
	users.users.bmarlowe = {
		packages = generalPkgs ++ nvimPkgs;
	};
}

