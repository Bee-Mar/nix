{
  description = "Flake-Based Nix/NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    {
      nixosConfigurations = {
        system76 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hardware/hardware-configuration.system76.nix
            ./system/configuration.nix
            ./user/configuration.nix
          ];
        };

        vmware = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hardware/hardware-configuration.vmware.nix
            ./system/configuration.nix
            ./user/configuration.nix
            ./work/configuration.nix
          ];
        };
      };

      defaultPackage = self.system76;
    };
}
