{ config, ... }:
{
  wayland.windowManager.hyprland = with config.colorScheme.palette; {
    enable = true;
    settings = {
      monitor = "eDP-1,3200x2000@128,auto,1.6";

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;

        "col.active_border" = "rgb(${base06})";
        "col.inactive_border" = "rgb(${base00})";

        resize_on_border = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
    extraConfig = builtins.readFile ./hyprland.conf;
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = [
        {
          monitor = "";
          path = "~/Pictures/wallpapers/everforest/mist_forest_1.png";
          blur_passes = 2;
          contrast = 1;
          brightness = 0.3;
          vibrancy = 0.2;
          vibrancy_darkness = 0.2;
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "500, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dost_spacing = 0.35;
          dots_center = true;
          outer_color = "rgba(0,0,0,0)";
          inner_color = "rgba(0,0,0, 0.2)";
          font_color = "rgb(255,255,255)";
          fade_on_empty = false;
          rounding = -1;
          check_color = "rgb(204, 136, 34)";
          placeholder_text = "";
          hide_input = false;
          position = "0, -200";
          halign = "center";
          valign = "center";
        }
      ];

      label = [ ];

    };
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };
      listener = [
        # Lock screen after 5 min
        {
          timeout = 300;
          on-timeout = "hyprlock";
        }
        # Turn off screen after 7 minutes
        {
          timeout = 420;
          on-timout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        # Suspend system after 10 minutes
        {
          timeout = 600;
          on-timout = "systemctl suspend";
        }
      ];
    };
  };
}
