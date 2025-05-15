# Core Graphical Applications
{ config, pkgs, ... }:
{
  imports = [
    # window manager, lock screen, etc
    ./desktop
    # terminal emulator
    ./ghostty
    # web browser
    ./zen
  ];
}
