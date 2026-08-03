{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, disko }: {
    nixosConfigurations.bustard = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./digitalocean.nix
        disko.nixosModules.disko
        { disko.devices.disk.disk1.device = "/dev/vda"; }
        ./bustard/configuration.nix
      ];
    };
    nixosConfigurations.harrier = nixpkgs.lib.nixosSystem {
      modules = [ ./harrier/configuration.nix ];
    };
  };
}
