{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #config.boot.kernelPackages.virtualboxGuestAdditions
    open-vm-tools
  ];

  users.users.bmarlowe = {
    extraGroups = [ "docker" ];
  };

  services.xserver.videoDrivers = [ "vmware" ];

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

