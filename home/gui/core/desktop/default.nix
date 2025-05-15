{ ... }:
{
  imports = [
    ./hyprland
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  gtk.enable = true;

  # Notification service
  services.dunst.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # App launcher
  programs.tofi = {
    enable = true;
  };

}
