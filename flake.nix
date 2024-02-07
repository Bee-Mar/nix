{
  description = "Flake-Based Nix/NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    #nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager }: {

    nixosConfigurations = {
      system76 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          nixos-hardware.nixosModules.system76
          ./configuration.nix

          #home-manager.nixosModules.home-manager
          # {
          #            home-manager.useUserPackages = true;
          #            # home-manager.users.bmarlowe =
          #          }
        ];
      };
    };
  };
}
