{ pkgs
, remapKeys
, ...
}: {
  imports = [
    ../shared/yabai.nix
    ../shared/skhd.nix
  ];


  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.kevin.shell = pkgs.fish;

  documentation.enable = false;
  documentation.man.enable = false;

  time.timeZone = "Europe/Berlin";
  system.keyboard.enableKeyMapping = true;

  system.keyboard.swapLeftCommandAndLeftAlt = remapKeys;
}
