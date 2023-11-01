{ pkgs
, lib
, inputs
, config
, ...
}: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      lalt - e : yabai -m space --layout bsp
      lalt - s : yabai -m space --layout stack

      lalt - left  : yabai -m window --focus west
      lalt - down  : yabai -m window --focus south
      lalt - up    : yabai -m window --focus north
      lalt - right : yabai -m window --focus east

      lalt - 1 : yabai -m space --focus 1
      lalt - 2 : yabai -m space --focus 2
      lalt - 3 : yabai -m space --focus 3
      lalt - 4 : yabai -m space --focus 4
      lalt - 5 : yabai -m space --focus 5
      lalt - 6 : yabai -m space --focus 6
      lalt - 7 : yabai -m space --focus 7
      lalt - 8 : yabai -m space --focus 8
      lalt - 9 : yabai -m space --focus 9
      lalt - 0 : yabai -m space --focus 10

      lalt + shift - 1 : yabai -m window --space 1 && yabai -m space --focus 1
      lalt + shift - 2 : yabai -m window --space 2 && yabai -m space --focus 2
      lalt + shift - 3 : yabai -m window --space 3 && yabai -m space --focus 3
      lalt + shift - 4 : yabai -m window --space 4 && yabai -m space --focus 4
      lalt + shift - 5 : yabai -m window --space 5 && yabai -m space --focus 5
      lalt + shift - 6 : yabai -m window --space 6 && yabai -m space --focus 6

      lalt - f : yabai -m window --toggle float
      lalt + shift - q : yabai -m window --close

      lalt - return : open -na alacritty
      lalt - b : open -na /Applications/Google\ Chrome.app/

      ralt - d : open -na /Applications/Nix\ Apps/Raycast.app/
    '';
  };
}
