{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${system}.devenv
    cachix

    nixpkgs-fmt
    sops

    _1password
    jq
    awscli2
    htop
    pigz
    ssm-session-manager-plugin
    wget
    wireguard-tools
    mysql80
  ];
}

