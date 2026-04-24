{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    cachix

    nixpkgs-fmt
    sops

    _1password-cli
    jq
    gnused
    ripgrep
    unixtools.watch
    htop
    coreutils
    pigz
    ssm-session-manager-plugin
    wget
    #wireguard-tools
    #mysql80
    mariadb
    kubectl
    kubectx
    kubernetes-helm
    kubent

    terraform

    istioctl
    docker-client
    docker-buildx
    dive
    gh
    k6
    awscli2
    eksctl

    nodejs_22
    kind
    natscli
    nsc
    buf
    protoc-gen-go
    protoc-gen-connect-go
    iperf
    amazon-ecr-credential-helper
    goreleaser
    golangci-lint
    gotools
    pv
    mtr
    terragrunt
    lazysql
    argo-workflows
    claude-code
    graphviz
    krew
    github-copilot-cli
    k3d
    mise
    pipx
    opencode
    yq
    codex
  ];
}

