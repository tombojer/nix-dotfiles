{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    tinygo
  ];

  programs.go = {
    enable = true;
    package = pkgs.go_1_25;
  };
}
