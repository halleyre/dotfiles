{ modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      (modulesPath + "/profiles/qemu-guest.nix")
      ./disk-config.nix

      ./packages/services.nix
      ./packages/system.nix
      ./packages/halleyre.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking = {
    hostName = "harrier";
    networkmanager.enable = true;
  };

  users = {
    mutableUsers = false;
    users.halleyre = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcYms82NGEkFGd7NZNt6jv7srNpt5Ucukj5i13JfNG8 halleyre@magpie"
      ];
      hashedPassword = "$6$bigsaltman$tP4WluxhJDZjuAySWikrRz8hE/kzrEz19UCbk7PSbVXEwhivaDAfXXYCon6oAl2SS84PwM/ZW59RzjiTjdNvv/";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # Don't touch
  system.stateVersion = "26.05"; # Did you read the comment?

}

