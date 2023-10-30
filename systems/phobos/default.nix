{ ...
}: {
  services.nix-daemon.enable = true;
  nixpks.config.allowUnfree = true;
}
