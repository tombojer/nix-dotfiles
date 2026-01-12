{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    rustup
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.home.homeDirectory}/.cargo";
    RUSTUP_HOME = "${config.home.homeDirectory}/.rustup";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}
