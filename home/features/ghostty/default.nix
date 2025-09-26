{ pkgs, config, ... }: {

  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableFishIntegration = true;

    settings = {
      theme = "dark:Catppuccin Frappe,light:Catppuccin Latte";
      font-size = 16;
      keybind = [
        "ctrl+shift+h=goto_split:left"
        "ctrl+shift+l=goto_split:right"
        "ctrl+shift+j=goto_split:down"
        "ctrl+shift+k=goto_split:up"
      ];
    };
  };
}
