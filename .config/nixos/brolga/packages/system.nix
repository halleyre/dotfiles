{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil # nix lsp

    starship # prompt
    carapace # completions

    yazi   # file explorer
    zoxide # smart cd

    git   # version control
    helix # text editor

    wget
  ];
}
