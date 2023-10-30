{
  description = "Home Manager configuration";

  nixConfig = {
    extra-trusted-public-keys = "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=";
    extra-substituters = "https://cache.garnix.io";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv.url = "github:cachix/devenv/main";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = 
    { self
    , nixpkgs
    , home-manager
    , devenv
    , ... 
      }: 
      let 
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      extraArgs = {
        flake = self;
      };
      in
      {
        defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
        defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

        homeConfigurations = {

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