alias r := rebuild
alias d := develop
alias f := format

rebuild HOST:
    sudo nixos-rebuild --flake .#{{HOST}} switch --show-trace

develop:
    nix develop

format:
    treefmt
