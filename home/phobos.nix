{ config
, pkgs
, lib
, flake
, ... }:

{
  imports = [
    flake.inputs.mac-app-util.homeManagerModules.default
    ./default.nix
  ];

  home.username = "kevin";
  home.homeDirectory = lib.mkForce "/Users/kevin";

  home.packages = with pkgs; [
    skhd
  ];
}
