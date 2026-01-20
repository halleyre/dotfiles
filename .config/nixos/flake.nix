{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.magpie = nixpkgs.lib.nixosSystem {
      modules = [ ./magpie/configuration.nix ];
    };
    nixosConfigurations.harrier = nixpkgs.lib.nixosSystem {
      modules = [ ./harrier/configuration.nix ];
    };
  };
}
