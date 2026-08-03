{ pkgs, ... }:

{
  users.users.halleyre.packages = with pkgs; [
    # terminal
    radare2

    # language servers
    clang-tools
    rust-analyzer
    typescript-language-server
  ];
}
