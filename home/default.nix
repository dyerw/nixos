{
  pkgs,
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
    jost
    libre-baskerville
    monoid
  ];
  programs.cmus.enable = true;

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
