{ ... }:
{
  imports = [
    ./hyprland
  ];
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
