{ pkgs
, ...
}: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
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
      "bruno"
      "rancher"
      "orbstack"
      "gitify"
    ];
  };
}
