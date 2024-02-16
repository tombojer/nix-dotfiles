{ config
, pkgs
, lib
, ... }:

{
  imports = [
    ./default.nix
  ];

  home.username = "kevin";
  home.homeDirectory = lib.mkForce "/Users/kevin";

  home.packages = with pkgs; [
    skhd
  ];
}
