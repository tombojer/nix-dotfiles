{
  pkgs,
  ...
}: {
  services.aerospace = {
    enable = true;
    package = pkgs.aerospace;

    settings= {
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      on-focus-changed = [
        "move-mouse window-lazy-center"
      ];

      on-window-detected = [
        {
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          run = [
            "layout tiling"
          ];
        }
      ];

      automatically-unhide-macos-hidden-apps = false;

      accordion-padding = 20;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      gaps = {
        outer.bottom = 10;
        outer.top = 10;
        outer.left = 10;
        outer.right = 10;
        inner.horizontal = 10;
        inner.vertical = 10;
      };

      key-mapping.preset = "qwerty";
      mode.main.binding = {
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";

        alt-shift-p = "workspace --wrap-around prev";
        alt-shift-n = "workspace --wrap-around next";

        alt-shift-1 = ["move-node-to-workspace 1" "workspace 1"];
        alt-shift-2 = ["move-node-to-workspace 2" "workspace 2"];
        alt-shift-3 = ["move-node-to-workspace 3" "workspace 3"];
        alt-shift-4 = ["move-node-to-workspace 4" "workspace 4"];

        alt-h = "focus --boundaries-action wrap-around-the-workspace left";
        alt-l = "focus --boundaries-action wrap-around-the-workspace right";
        alt-k = "focus --boundaries-action wrap-around-the-workspace up";
        alt-j = "focus --boundaries-action wrap-around-the-workspace down";

        alt-shift-h = "move left";
        alt-shift-l = "move right";
        alt-shift-k = "move up";
        alt-shift-j = "move down";
        alt-comma = "join-with left";
        alt-period = "join-with right";


        alt-s = "layout v_accordion";
        alt-w = "layout h_accordion";
        alt-e = "layout tiles horizontal vertical";

        alt-shift-space = "layout floating tiling";

        alt-enter = "exec-and-forget open -na Ghostty";
        alt-b = "exec-and-forget open -na \"Google Chrome\" --args --new-window";


        alt-shift-q = "close --quit-if-last-window";

        alt-r = "mode resize";
        alt-shift-comma = "mode layout";
        alt-shift-right = "move-node-to-monitor right";
        alt-shift-left = "move-node-to-monitor left";
      };

      mode.resize.binding = {
        left = "resize width +50";
        right = "resize width -50";
        up = "resize height +50";
        down = "resize height -50";
        enter = "mode main";
        esc = "mode main";
      };

      mode.layout.binding = {
        esc = "mode  main";
        enter = "mode main";
        r = "flatten-workspace-tree";
        alt-left = "join-with left";
        alt-right = "join-with right";
        alt-up = "join-with up";
        alt-down = "join-with down";
      };
    };
  };
}
