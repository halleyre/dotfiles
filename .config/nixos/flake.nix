{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.harrier = nixpkgs.lib.nixosSystem {
      modules = [ ./harrier/configuration.nix ];
    };
  };
}
