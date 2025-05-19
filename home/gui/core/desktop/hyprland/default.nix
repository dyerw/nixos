{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = "eDP-1,3200x2000@128,auto,1.6";

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;

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
