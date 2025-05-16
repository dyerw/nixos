function nix-template -a lang dir
    nix flake new --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$lang" $dir
end
