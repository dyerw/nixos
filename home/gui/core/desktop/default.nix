{ ... }:
{
  # Notification service
  services.dunst.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # App launcher
  programs.tofi.enable = true;

  # TODO: Move this config as much as possible
  # to a static file, maybe symlink?
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      # TODO: Can I define this in hosts somehow?
      monitor = "eDP-1, 3200x2000@120, auto, 1.6";
      bind = [
        "$mod, Q, killactive"
        "$mod, SPACE, exec, tofi-drun --drun-launch=true"
        "$mod, RETURN, exec, ghostty"
        # VIM-style focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
      ];
    };
  };
}
