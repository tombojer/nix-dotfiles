{ pkgs, ... }: {

  home.packages = with pkgs; [
    fzf
    fd
    bat
    eza
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    plugins = [
      { name = "fzf"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
  };

  programs.starship = {
    enable = true;

    settings = {
      aws.disabled = true;
      gcloud.disabled = true;
    };
  };

  home.shellAliases = {
    "ls" = "eza -lah";
  };

}
