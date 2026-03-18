{ pkgs, ... }:

{
  users.users.halleyre.packages = with pkgs; [
    # terminal
    radare2

    # ui
    nautilus # stupid ass gtk filechooser (check out termchooser sometime to utilise yazi)
    (catppuccin-gtk.override { variant = "mocha"; })

    # language servers
    clang-tools
    rust-analyzer
    typescript-language-server
  ];
}
