{ pkgs, config, ... }@args:

{
	users.users.bmarlowe = {
		packages = with pkgs; [
			python311
			neovim
			xsel
			jq
			tree
			htop
			silver-searcher
			
		];
	};
}
