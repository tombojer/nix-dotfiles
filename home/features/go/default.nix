{ pkgs, config, ... }: {

  programs.go = {
    enable = true;
    package = pkgs.go_1_25;
    goPath = ".go";
  };
}
