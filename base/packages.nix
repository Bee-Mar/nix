{ pkgs, config, ... }@args:

{
	environment.systemPackages = with pkgs; [ 
		config.boot.kernelPackages.virtualboxGuestAdditions
		wget
		curl
		firefox
		git
	];
}
