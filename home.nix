{ config, pkgs, ... }:

{
    home.username = "liam";
    home.homeDirectory = "/home/liam";

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
        monitor = "eDP-1, 3200x2000@120, auto, 1";
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

