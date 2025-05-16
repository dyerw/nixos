{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  home.username = "liam";
  home.homeDirectory = "/home/liam";

  xdg.enable = true;
  services.ssh-agent.enable = true;

  home.packages = with pkgs; [
    dissent
    fractal

    # Fonts
    font-awesome
    jetbrains-mono
    cozette
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
