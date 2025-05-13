{ config, pkgs, ... }:

{
    home.username = "liam";
    home.homeDirectory = "/home/liam";

    home.pointerCursor = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 24;
    };

    home.packages = with pkgs; [
      neofetch
      yazi

      #archives
      zip
      xz
      unzip

      #utils
      ripgrep
      jq
      eza
      fzf
    ];
    programs.git = {
      enable = true;
      userName = "Liam Dyer";
      userEmail = "dev@liamdyer.com";
    };
    services.ssh-agent.enable = true;
    programs.starship = {
      enable = true;
    };
    programs.ghostty = {
      enable = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        cursor = {
          no_hardware_cursors = true;
        };
        monitor = "DP-1, 3200x2000@60, auto, 1.5";
        bind = [
          "$mod, RETURN, exec, ghostty"
          "$mod, Q, killactive"
          "$mod, SPACE, exec, rofi -show drun"
        ];
        render = {
          explicit_sync = 2;
          explicit_sync_kms = false;
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          vfr = true;
          vrr = 1;
          force_default_wallpaper = 0;
        };
        env = [
          "WLR_NO_HARDWARE_CURSORS,1"
          "WLR_DRM_NO_ATOMIC,1"
          "WLR_RENDERER,vulkan"
          "LIBVA_DRIVER_NAME,radeonsi"
          "AMD_VULKAN_ICD,RADV"
        ];
        animations = {
          enabled = false;
        };
        input = {
          kb_layout = "us";
          follow_mouse = 1;
        };
        decoration = {
          rounding = 0;
          blur.enabled = false;
        };

      };
    };

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;    
}

