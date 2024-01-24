{ pkgs, config, ... }@args:

{

	environment.systemPackages = with pkgs; [ 
		config.boot.kernelPackages.virtualboxGuestAdditions
		wget
		curl
		jq
		firefox
	];


	users.users.bpm = {
		packages = with pkgs; [
			python311
			neovim
		];
	};
}
