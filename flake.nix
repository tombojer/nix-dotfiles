{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
        defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
        defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

        homeConfigurations = {

            # VM running Arch Linux
            "kevin@archlinux-vm" = home-manager.lib.homeManagerConfiguration {
                modules = [ ./home/archlinux-vm.nix ];
                pkgs = import nixpkgs { system = "x86_64-linux"; };
            };

            # Dell XPS 15 9500 running Arch Linux
            "kevin@archlinux" = home-manager.lib.homeManagerConfiguration {
                modules = [ ./home/archlinux-vm.nix ];
                pkgs = import nixpkgs { system = "x86_64-linux"; };
            };
        };
    };
}