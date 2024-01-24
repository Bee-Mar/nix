{ config, pkgs, ... }@args:

{
	environment.systemPackages = with pkgs; [
		config.boot.kernelPackages.virtualboxGuestAdditions
	];

	users.users.bpm = {
		extraGroups = [ "docker" ];
	};
	
	virtualisation = {
		virtualbox.guest.enable = true;
		virtualbox.guest.x11 = true;
		docker.enable = true;
		podman.enable = true;
	}; 
}

