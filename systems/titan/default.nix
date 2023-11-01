{ pkgs
, remapKeys
, home-manager
, lib
, config
, ...
}: {
  imports = [
    ../shared/yabai.nix
    ../shared/skhd.nix
    ../shared/brew.nix
    ../shared/system.nix
  ];

  users.users.kevin = {
    home = "/Users/kevin";
    shell = "${pkgs.fish}/bin/fish";
  };

  home-manager.users.kevin = { imports = [
    ../../home/titan.nix
  ];};


  nix = {
    settings.trusted-users = [ "root" "kevin" ];
  };

  environment.systemPackages = with pkgs; [
    raycast
  ];

  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  environment.shells = [ "${pkgs.fish}/bin/fish" ];

  documentation.enable = false;
  documentation.man.enable = false;

  time.timeZone = "Europe/Berlin";
  system.keyboard.enableKeyMapping = true;

  system.keyboard.swapLeftCommandAndLeftAlt = remapKeys;


  # Nix config from https://github.com/DeterminateSystems/nix-installer
  nix.settings.build-users-group = "nixbld";
  nix.settings.experimental-features = "nix-command flakes repl-flake";
  nix.settings.bash-prompt-prefix = "(nix:$name)\040";
  nix.settings.max-jobs = "auto";
  nix.settings.extra-nix-path = "nixpkgs=flake:nixpkgs";


  # Maybe this works with Sonoma?
  system.activationScripts.applications.text = lib.mkForce ''
    # echo "setting up ~/Applications..." >&2
    # applications="$HOME/Applications"
    # nix_apps="$applications/Nix Apps"

    # # Needs to be writable by the user so that home-manager can symlink into it
    # if ! test -d "$applications"; then
    #     mkdir -p "$applications"
    #     chown kevin: "$applications"
    #     chmod u+w "$applications"
    # fi

    # # Delete the directory to remove old links
    # rm -rf "$nix_apps"
    # mkdir -p "$nix_apps"
    # find ${config.system.build.applications}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    #     while read src; do
    #         # Spotlight does not recognize symlinks, it will ignore directory we link to the applications folder.
    #         # It does understand MacOS aliases though, a unique filesystem feature. Sadly they cannot be created
    #         # from bash (as far as I know), so we use the oh-so-great Apple Script instead.
    #         /usr/bin/osascript -e "
    #             set fileToAlias to POSIX file \"$src\" 
    #             set applicationsFolder to POSIX file \"$nix_apps\"
    #             tell application \"Finder\"
    #                 make alias file to fileToAlias at applicationsFolder
    #                 # This renames the alias; 'mpv.app alias' -> 'mpv.app'
    #                 set name of result to \"$(rev <<< "$src" | cut -d'/' -f1 | rev)\"
    #             end tell
    #         " 1>/dev/null
    #     done
  '';
}
