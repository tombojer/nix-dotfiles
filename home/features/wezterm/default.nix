{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    wezterm
  ];

  home.file = {
    ".config/wezterm/wezterm.lua".source =
      config.lib.file.mkOutOfStoreSymlink ./wezterm.lua;
  };
}