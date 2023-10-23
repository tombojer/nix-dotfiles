{ config, pkgs, ... }:

{
  imports = [
    ./general.nix
  ];

  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.packages = [
    pkgs.hello
    pkgs.pokemonsay
  ];  
}
