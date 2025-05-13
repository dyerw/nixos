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
      dissent
    ];
    programs.git = {
      enable = true;
      userName = "Liam Dyer";
      userEmail = "dev@liamdyer.com";
      delta.enable = true;
    };
    programs.lazygit = {
      enable = true;
      settings = {
        git.paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
    services.ssh-agent.enable = true;
    services.dunst.enable = true;
    programs.starship = {
      enable = true;
    };
    programs.ghostty = {
      enable = true;
    };

    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    programs.tofi = {
      enable = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        monitor = "eDP-1, 3200x2000@120, auto, 1.333333";
        bind = [
          "$mod, RETURN, exec, ghostty"
          "$mod, Q, killactive"
          "$mod, SPACE, exec, tofi-drun --drun-launch=true"
        ];
      };
    };

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;    
}

