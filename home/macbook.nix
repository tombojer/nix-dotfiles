{ config
, pkgs
, lib
, flake
, ... }:


{
  imports = [
    flake.inputs.mac-app-util.homeManagerModules.default
    ./default.nix
    ./features/darwin
  ];

  home.username = "t.bojer";
  home.homeDirectory = lib.mkForce "/Users/t.bojer";

  home.packages = with pkgs; [
    skhd
    spotify
  ];
}
