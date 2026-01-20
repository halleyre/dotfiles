{ pkgs, ... }:

{
  users.users.halleyre.packages =  with pkgs; [
    bitwarden-cli

    # browsers
    (chromium.override {
      commandLineArgs = "--ozone-platform=wayland";
    })              # main
    tor-browser     # onion routing
    mullvad-browser # fingerprint prevention

    (obsidian.override {
      makeDesktopItem = defaults@{ exec, ... }:
        makeDesktopItem (defaults // { exec = "obsidian --ozone-platform=wayland %u"; });
    })

  # dev
    radare2
    vscode

  # language servers
    clang-tools
    rust-analyzer
    typescript-language-server

  # ui
    swaybg
    swaynotificationcenter
    nautilus # gtk filechooser （＾～＾）work out termchooser later
    (catppuccin-gtk.override { variant = "mocha"; }) # gnome theme

  # apps
    libresprite

  # virtualisation / emulation
    spice
    spice-gtk
    spice-protocol
    virt-viewer
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
}
