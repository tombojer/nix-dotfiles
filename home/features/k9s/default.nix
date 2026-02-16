{ pkgs, config, ... }: {

  programs.k9s = {
    enable = true;
    package = pkgs.k9s;

    # Define your custom skin
    skins = {
      my-theme = {
        k9s = {
          body = {
            bgColor = "default";
          };
          prompt = {
            bgColor = "default";
          };
          info = {
            sectionColor = "default";
          };
          dialog = {
            bgColor = "default";
            labelFgColor = "default";
            fieldFgColor = "default";
          };
          frame = {
            crumbs = {
              bgColor = "default";
            };
            title = {
              bgColor = "default";
              counterColor = "default";
            };
            menu = {
              fgColor = "default";
            };
          };
          views = {
            charts = {
              bgColor = "default";
            };
            table = {
              bgColor = "default";
              header = {
                fgColor = "default";
                bgColor = "default";
              };
            };
            xray = {
              bgColor = "default";
            };
            logs = {
              bgColor = "default";
              indicator = {
                bgColor = "default";
                toggleOnColor = "default";
                toggleOffColor = "default";
              };
            };
            yaml = {
              colonColor = "default";
              valueColor = "default";
            };
          };
        };
      };
    };

    # Activate the skin
    settings = {
      k9s = {
        ui = {
          skin = "my-theme";
        };
      };
    };
  };
}

