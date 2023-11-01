{ pkgs
, ...
}: {
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;

    autohide-time-modifier = 0.2;
    expose-animation-duration = 0.2;
    tilesize = 48;
    launchanim = false;
    static-only = false;
    showhidden = true;
    show-recents = false;
    show-process-indicators = true;
    orientation = "bottom";
    mru-spaces = false;
  };
}
