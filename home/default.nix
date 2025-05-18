{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.everforest-dark-hard;
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
    jost
    libre-baskerville
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
