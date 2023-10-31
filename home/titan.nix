{ config, pkgs, ... }:

{
  imports = [
    ./default.nix
  ];

  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.packages = [
    pkgs.skhd
    pkgs.alacritty
  ];
}
