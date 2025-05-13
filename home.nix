{ config, pkgs, ... }:

{
    home.username = "liam";
    home.homeDirectory = "/home/liam";

    xresources.properties = {
      "Xcursor.size" =  16;
      "Xft.dpi" = 172;
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
    programs.starship = {
      enable = true;
    };
    programs.ghostty = {
      enable = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor = ",preferred,auto,2";
        "$mod" = "SUPER";
        env = [
          "LIBVA_DRIVER_NAME,radeonsi"
        ];
        bind = [
          "$mod, RETURN, exec, ghostty"
          "$mod, Q, killactive"
          "$mod, SPACE, exec, rofi -show drun"
        ];
      };
    };

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;    
}

