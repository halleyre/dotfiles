{
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/fc40ef0043a219f9.tar.gz") {},
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ./packages/system.nix
    ./packages/halleyre.nix

    ./misc/dconf.nix
    ./misc/systemd.nix
    # ./misc/virtualisation.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.steam-hardware.enable = true;

  networking = {
    hostName = "magpie";
    networkmanager.enable = true;
  };

  time.timeZone = "Australia/NSW";

  fonts.packages = [ pkgs.nerd-fonts.overpass ];

  users = {
    mutableUsers = false;
    users.halleyre = {
      hashedPassword = "$6$supbossman$ZA64EAeI03jpfQfLxkVtT3hNGGyTG/WKmWbIV7Z1NeaJqfJz32DcxFQf6/cfpEHwodgKb87AKpL0yiRrkJewu0";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "libvirtd" "adbusers" ];
    };
  };

  


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix)
  # system.copySystemConfiguration = true;

  system.stateVersion = "24.05"; # Don't Touch
}

