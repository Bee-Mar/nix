{ pkgs, config, ... }@args:

{
	environment.systemPackages = with pkgs; [ 
		#config.boot.kernelPackages.virtualboxGuestAdditions
		vim
		wget
		curl
		firefox
		git
	];
}
