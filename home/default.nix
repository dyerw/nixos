{ config, pkgs, inputs, lib, ... }:
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
    programs.starship = {
      enable = true;
    };


    home.stateVersion = "24.11";
    programs.home-manager.enable = true;    
}

