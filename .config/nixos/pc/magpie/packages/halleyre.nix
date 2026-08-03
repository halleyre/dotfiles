{ pkgs, ... }:

{
  imports = [
    ./browsers/browsers.nix
  ];
  users.users.halleyre.packages =  with pkgs; [
  # utilities
    bitwarden-cli
    pavucontrol

  # apps
    libresprite
    signal-desktop
    obsidian

  # terminal apps
    radare2
    gitui

  # language servers
    clang-tools
    rust-analyzer
    typescript-language-server

  # ui
    swaybg
    swaynotificationcenter
    nautilus # gtk filechooser （＾～＾）work out termchooser later
    (catppuccin-gtk.override { variant = "mocha"; }) # gnome theme

  # virtualisation / emulation
    spice
    spice-gtk
    spice-protocol
    virt-viewer
  ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };
  };
}
