{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  
  # TODO: Figure out how to source local fish files
  # programs.fish.interactiveShellInit = [];
}
