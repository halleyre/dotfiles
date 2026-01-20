{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./packages/services.nix
      ./packages/system.nix
      ./packages/halleyre.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  networking = {
    hostName = "harrier";
    networkmanager.enable = true;
  };

  users = {
    mutableUsers = false;
    users.halleyre = {
      hashedPassword = "$6$bigsaltman$tP4WluxhJDZjuAySWikrRz8hE/kzrEz19UCbk7PSbVXEwhivaDAfXXYCon6oAl2SS84PwM/ZW59RzjiTjdNvv/";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # Don't touch
  system.stateVersion = "26.05"; # Did you read the comment?

}

