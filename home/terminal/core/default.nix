{ pkgs, ... }:
{
  # git
  programs.git = {
    enable = true;
    userName = "Liam Dyer";
    userEmail = "dev@liamdyer.com";
  };
  programs.starship.enable = true;

  # general utilites
  home.packages = with pkgs; [
    neofetch
    yazi
    fd
    ripgrep
    jq
    eza
    fzf
    zip
    lazygit
    lazydocker
    wirelesstools
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  imports = [
    ./fish
    ./helix
  ];

  home.shellAliases = {
    cd = "z";
    ls = "eza";
    lzg = "lazygit";
    lzd = "lazydocker";
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
