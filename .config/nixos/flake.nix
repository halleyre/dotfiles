{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
  outputs = { self, nixpkgs, nixos-wsl }: {
    nixosConfigurations.magpie = nixpkgs.lib.nixosSystem {
      modules = [ ./magpie/configuration.nix ];
    };
    nixosConfigurations.harrier = nixpkgs.lib.nixosSystem {
      modules = [ ./harrier/configuration.nix ];
    };
    nixosConfigurations.brolga = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ ./brolga/configuration.nix
        nixos-wsl.nixosModules.default {
          system.stateVersion = "24.11";
          wsl.enable = true;
        }
      ];
    };
  };
}
