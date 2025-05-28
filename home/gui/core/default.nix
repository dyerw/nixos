# Core Graphical Applications
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # file browser
    nemo
    brightnessctl
  ];
  imports = [
    # window manager, lock screen, etc
    ./desktop
    # terminal emulator
    ./ghostty
    # web browser
    ./zen
  ];
}
