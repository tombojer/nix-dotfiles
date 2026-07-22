{ pkgs
, ...
}: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # nix-darwin currently emits the removed `--force-cleanup` flag for
      # cleanup = "uninstall", so pass the current Homebrew flag directly.
      cleanup = "none";
      extraFlags = [ "--cleanup" ];
      upgrade = true;
    };

    taps = [
      "platformsh/tap"
      "aws/tap"
      "nikitabobko/tap"
    ];

    brews = [
      "docker-credential-helper"
      "argocd"
      "dnsmasq"
      "grpcurl"
      "exiftool"
      "azure-cli"
      "mysql-client"
    ];

    casks = [
      "rancher"
      "orbstack"
    ];
  };
}
