{ pkgs, inputs, ... }:
{
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./hyprland
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };
  gtk.enable = true;

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
  };

  # App launcher
  programs.tofi = {
    enable = true;
  };

}
