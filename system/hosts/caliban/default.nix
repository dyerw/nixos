# caliban specific configuration
{ pkgs, ... }:
let
  hostName = "caliban";
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = ./themes/everforest-base16.yaml;
    image = ./walls/forest.png;
    autoEnable = true;
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 20;
    fonts = {
      monospace = {
        package = pkgs.cozette;
        name = "CozetteHiDpi";
      };
      sansSerif = {
        package = pkgs.ubuntu-sans;
        name = "Ubuntu Sans";
      };
    };
  };

  # Q: inherit?
  networking.hostName = hostName;

  # Desktop
  services.xserver.displayManager.gdm.enable = true;
  # It's nice to keep gnome around for when hyprland config goes sideways
  services.xserver.desktopManager.gnome.enable = true;

  hardware.enableAllFirmware = true;
  hardware.graphics = {
    # Q: The docs say this is "enabled by default by the corresponding modules"
    # but the AMD GPU wiki page says "graphics acceleration does need to be enabled"
    # so uh?
    enable = true;
    enable32Bit = true;
  };

  # Mount my NAS docker share folder
  fileSystems."/mnt/miranda/docker" = {
    device = "miranda:/volume1/docker";
    fsType = "nfs";
  };
  fileSystems."/mnt/miranda/data" = {
    device = "miranda:/volume1/data";
    fsType = "nfs";
  };

  # TODO: Should this go here?
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # Can't remember the last time I printed something but sure
  services.printing.enable = true;

  # Sound
  # Apparently pipewire is the hot new alternative to pulseaudio
  # Either way, we need something to make sound work
  hardware.pulseaudio.enable = false;
  # PipeWire uses this to "acquire realtime priority"
  security.rtkit.enable = true;
  services.pipewire = {
    # TODO: Understand what all this shit is
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    pavucontrol
    playerctl
  ];

  # login screen
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  programs.steam.enable = true;

  security.pam.services.hyprlock = { };

  system.stateVersion = "24.11";
}
