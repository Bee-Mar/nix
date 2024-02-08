{
  description = "Flake-Based Nix/NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    #nixos-hardware.url = "github:NixOS/nixos-hardware";
    #home-manager.url = "github:nix-community/home-manager/release-23.11";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations = {
      system76 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hardware/hardware-configuration.system76.nix
          ./configuration.nix
        ];
      };

      vmware = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hardware/hardware-configuration.vmware.nix
          ./configuration.nix
          ./work/configuration.nix
        ];
      };
    };
  };
}
