{ config, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      font-size = 12;
    };
  };
}
