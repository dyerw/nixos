alias r := rebuild
alias d := develop
alias f := format

rebuild HOST:
    sudo nixos-rebuild --flake .#{{HOST}} switch

develop:
    nix develop

format:
    treefmt
