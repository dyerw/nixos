{ pkgs, ... }:
{
  # git
  programs.git = {
    enable = true;
    userName = "Liam Dyer";
    userEmail = "dev@liamdyer.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      # use nerd fonts
      package.symbol = "󰏗 ";
      rust.symbol = "󱘗 ";
      c.symbol = " ";
      # Unknown key error?
      # cpp.symbol = " ";
      cmake.symbol = " ";
      directory.read_only = " 󰌾";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fennel.symbol = " ";
      git_branch.symbol = " ";
      git_commit.tag_symbol = "  ";
      golang.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      hostname.ssh_symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      zig.symbol = " ";
    };
  };

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
    lazysql
    docker-compose
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
