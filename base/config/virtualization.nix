{ pkgs, ... }@args:

{
	#environment.systemPackages = with pkgs; [
		#config.boot.kernelPackages.virtualboxGuestAdditions
	#];
	
	users.users.bmarlowe = {
		extraGroups = [ "docker" ];
	};
	
	virtualisation = {
		# for virtualbox
		#virtualbox.guest.enable = true;
		#virtualbox.guest.x11 = true;

		# for vmware
		vmware.guest.enable = true;
		docker.enable = true;
		podman.enable = true;
	}; 
}

