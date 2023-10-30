{
  description = "Home Manager configuration";

  nixConfig = {
    extra-trusted-public-keys = "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=";
    extra-substituters = "https://cache.garnix.io";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv.url = "github:cachix/devenv/main";
    devenv.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs =
    { self
    , nixpkgs
    , nix-darwin
    , home-manager
    , devenv
    , sops-nix
    , ...
    }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      extraArgs = {
        inherit sops-nix;
        flake = self;
      };
    in
    {
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

      darwinConfigurations = {
        phobos = nix-darwin.lib.darwinSystem {
          specialArgs = extraArgs // {
            remapKeys = true;
          };
          system = "aarch64-darwin";
          modules = [
            ./systems/phobos
            home-manager.darwinModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = extraArgs;
            }
          ];
        };
      };

      homeConfigurations = {
        # MacBook Pro M2 Pro 16"
        "kevin@phobos" = home-manager.lib.homeManagerConfiguration {
          modules = [ ./home/phobos.nix ];
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          extraSpecialArgs = extraArgs;
        };

        # VM running Arch Linux
        "kevin@archlinux-vm" = home-manager.lib.homeManagerConfiguration {
          modules = [ ./home/archlinux-vm.nix ];
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          extraSpecialArgs = extraArgs;
        };

        # Dell XPS 15 9500 running Arch Linux
        "kevin@archlinux" = home-manager.lib.homeManagerConfiguration {
          modules = [ ./home/archlinux.nix ];
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          extraSpecialArgs = extraArgs;
        };
      };
    };
}
