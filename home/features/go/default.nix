{ pkgs, config, ... }: {

  programs.go = {
    enable = true;
    package = pkgs.go_1_22;
    goPath = ".go";
  };
}
