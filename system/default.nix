# Here we define all NixOS config that applies to all systems
{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  users.users.liam = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  networking.extraHosts = "192.168.0.189 miranda";

  # TODO: Say 10 Hail Stallmans in penance
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://cache.nixos.org/"
      "https://agda-devshell.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.iog.io"
      "https://iohk.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "agda-devshell.cachix.org-1:qPjcQUeeMNRXosSXoT9zWSwHG2TyGG75Uojfso6FHd8="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "cache.iog.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
    ];
  };

  # This is stuff we _always_ want to be able to use a system
  # Basically, I need to checkout repos, access the internet,
  # and edit text
  environment.systemPackages = with pkgs; [
    git
    helix
    wget
    wev
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = 1;
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}
