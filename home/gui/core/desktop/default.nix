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
    settings = {
      theme = {
        # font.name = "";
      };
      layout = {
        "bar.layouts" = {
          "*" = {
            "left" = [
              "dashboard"
              "workspaces"
              "media"
            ];
            "middle" = [
              "cpu"
              "ram"
              "storage"
            ];
            "right" = [
              "systray"
              "volume"
              "bluetooth"
              "network"
              "battery"
              "clock"
              "notifications"
            ];
          };
        };
      };
      bar = {
        launcher.icon = "";
        clock = {
          format = "%I:%M %p";
        };
      };
    };
    inherit (hyprpanelTheme) override;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/wallpapers/everforest/mist_forest_1.png"
      ];
      wallpaper = [ "eDP-1,~/Pictures/wallpapers/everforest/mist_forest_1.png" ];
    };
  };

  # App launcher
  programs.wofi = {
    enable = true;
  };
}
