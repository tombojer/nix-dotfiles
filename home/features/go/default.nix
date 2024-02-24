{ pkgs, config, ... }: {

  programs.go = {
    enable = true;
    goPath = ".go";
  };
}
