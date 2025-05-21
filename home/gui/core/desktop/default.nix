{
  pkgs,
  inputs,
  config,
  ...
}:

let
  hyprpanelTheme = import ./hyprpanel-theme.nix config;
in
{
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./hyprland
  ];

  gtk.enable = true;

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    settings = {
      theme = {
        font.name = "Ubuntu Sans";
      };
      layout = {
        "bar.layouts" = {
          "*" = {
            "left" = [
              "cpu"
              "ram"
              "storage"
            ];
            "middle" = [
              "workspaces"
            ];
            "right" = [
              "volume"
              "bluetooth"
              "network"
              "battery"
              "clock"
            ];
          };
        };
      };
      bar = {
        launcher.icon = "";
        clock = {
          format = "%I:%M %p";
          showIcon = false;
        };
      };
    };
    inherit (hyprpanelTheme) override;
  };

  # services.hyprpaper = {
  #   enable = true;
  #   settings = {
  #     preload = [
  #       "~/Pictures/wallpapers/everforest/mist_forest_1.png"
  #     ];
  #     wallpaper = [ "eDP-1,~/Pictures/wallpapers/everforest/mist_forest_1.png" ];
  #   };
  # };

  # App launcher
  programs.wofi = {
    enable = true;
  };
}
