{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil # nix lsp

    starship # prompt
    carapace # completions

    yazi   # file explorer
    zoxide # smart cd

    tuigreet # greeter
    swaylock # screenlock
    brightnessctl

    yofi  # app launcher
    kitty # terminal emulator

    helix # editor

    xwayland-satellite

    cloudflared # tunnel
  ];

  programs.git.enable = true;
  programs.git.lfs.enable = true;
  programs.niri.enable = true;
  programs.waybar.enable = true;
}
