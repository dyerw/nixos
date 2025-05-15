{ config, pkgs, inputs, lib, ... }:
{
    home.username = "liam";
    home.homeDirectory = "/home/liam";

    xdg.enable = true;
    services.ssh-agent.enable = true;

    home.packages = with pkgs; [
      dissent

      # Fonts
      font-awesome
      jetbrains-mono
    ];


    home.stateVersion = "24.11";
    programs.home-manager.enable = true;    
}

