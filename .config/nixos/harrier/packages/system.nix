{ pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
    nil # nix lsp

    starship # prompt
    carapace # completions

    yazi   # file explorer
    zoxide # smart cd

    helix # text editor

    wget
  ];

  programs = {
    git.enable = true;
    git.lfs.enable = true;
  };
}
