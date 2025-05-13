{ config, pkgs, inputs, lib, ... }:
{
    home.username = "liam";
    home.homeDirectory = "/home/liam";

    home.packages = with pkgs; [
      neofetch
      yazi

      # Apps
      inputs.zen-browser.packages.${pkgs.system}.default

      #archives
      zip
      xz
      unzip

      # utils
      ripgrep
      jq
      eza
      fzf
      dissent

      # Fonts
      font-awesome
      jetbrains-mono
    ];
    programs.git = {
      enable = true;
      userName = "Liam Dyer";
      userEmail = "dev@liamdyer.com";
    };
    programs.lazygit = {
      enable = true;
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

    xdg.desktopEntries = {
      zen = {
        type = "Application";
        name = "Zen";
        exec = "zen";
        terminal = false;
      };
      discord = {
        type = "Application";
        name = "Discord";
        exec = "dissent";
        terminal = false;
      };
    };

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;    
}

