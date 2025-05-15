{ config, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink ./config.toml;
  xdg.configFile."helix/languages.toml".source = config.lib.file.mkOutOfStoreSymlink ./languages.toml;
}
