{
  description = "liam's nix configs";

  inputs = {
    # Make stable and unstable available
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:nix-community/stylix/release-24.11";

    # Programs not in nixpkgs
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyperPanel/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
        # If needed for other architectures, add here
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in
    {
      # Formats nix code
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      # nixos-rebuild --flake .#<host>
      nixosConfigurations = {
        # my personal laptop
        caliban = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            stylix.nixosModules.stylix
            ./system
            ./system/hosts/caliban

            { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.backupFileExtension = ".bak";

              home-manager.users.liam =
                { ... }:
                {
                  imports = [
                    ./home
                    ./home/gui/core
                    ./home/gui/music
                    ./home/terminal/core
                    ./home/terminal/development
                  ];
                };
            }
          ];
        };
        # In theory we can define more hosts here...
      };
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "nixos development shell";
        buildInputs = with pkgs; [
          nil
          nixfmt-rfc-style
          just
          treefmt
          yamlfmt
        ];
      };
    };
}
