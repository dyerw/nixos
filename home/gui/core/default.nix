# Core Graphical Applications
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # file browser
    nemo
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
