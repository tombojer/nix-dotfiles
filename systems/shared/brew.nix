{ pkgs
, ...
}: {

  homebrew = {
    enable = true;

    taps = [
      "platformsh/tap"
    ];

    brews = [
      "platformsh-cli"
    ];

    casks = [
      "bruno"
    ];
  };
}
