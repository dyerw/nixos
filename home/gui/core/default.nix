# Core Graphical Applications
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # file browser
    nemo
    brightnessctl
    # for when websites are weird in firefox for w/e reason
    ungoogled-chromium
    sqlitebrowser
    vscode
    beets
    libreoffice-qt
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
