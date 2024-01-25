{ pkgs, config, ... }:

let
	workPkgs = with pkgs; [
		awscli
	];

in {
	users.users.bmarlowe = {
		packages = workPkgs;
	};
}

