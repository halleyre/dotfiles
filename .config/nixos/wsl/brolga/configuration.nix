{ pkgs, ... }:

{
  imports = [
    ./packages/system.nix
    ./packages/halleyre.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "halleyre";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "brolga";

  fonts.packages = with pkgs; [ overpass ];

  users = {
    mutableUsers = false;
    users.halleyre = {
      hashedPassword = "$6$wannacrackme$BifH8Lp3mSmLFE6/5KdK29HwAYF.uCTWVfCQ7pc4/sQ/gj3DLIJRD68grBmXECyBJ2DVedOzVjkQBIe8FjhEw0";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # Read the docs!
  system.stateVersion = "24.11";
}
