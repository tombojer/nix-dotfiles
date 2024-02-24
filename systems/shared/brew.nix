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
    ];

    brews = [
      "platformsh-cli"
      "docker-credential-helper"
      "argocd"
      "dnsmasq"
      "eks-node-viewer"
      "grpcurl"
      "exiftool"
    ];

    casks = [
      "bruno"
      "rancher"
    ];
  };
}
