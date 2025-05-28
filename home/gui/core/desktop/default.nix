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
              "power"
              "cpu"
              "ram"
              "storage"
            ];
            "middle" = [
              "workspaces"
            ];
            "right" = [
              "hypridle"
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

  # App launcher
  programs.wofi = {
    enable = true;
  };
}
