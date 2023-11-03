{ pkgs, ... }: {

  home.packages = with pkgs; [
    fzf
    fd
    bat
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      # Overwrite default ctrl+r history-pager
      fzf_configure_bindings
    '';

    # workaround for fixing the path order: https://github.com/LnL7/nix-darwin/issues/122
    shellInit = ''
      for elt in $PATH
        if not contains -- $elt $oldPath /usr/local/bin /usr/bin /bin /usr/sbin /sbin
          set -ag fish_user_paths $elt
        end
      end
      set -el oldPath


      # Homebrew config
      set -gx HOMEBREW_PREFIX "/opt/homebrew";
      set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
      set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
      ! set -q PATH; and set PATH \'\'; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
      ! set -q MANPATH; and set MANPATH \'\'; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
      ! set -q INFOPATH; and set INFOPATH \'\'; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

      # Volta
      set -gx VOLTA_HOME $HOME/.volta
      fish_add_path $VOLTA_HOME/bin
    '';

    plugins = [
      { name = "fzf"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];

    functions = {
      c = ''
        # TODO: add zoxide function
      '';
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      aws.disabled = true;
      gcloud.disabled = true;
      command_timeout = 1500;
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableAliases = true;
  };

  home.shellAliases = {
    "wgup-staging" = "wg-quick up ~/.config/wireguard/staging.conf";
    "wgdown-staging" = "wg-quick down ~/.config/wireguard/staging.conf";
  };

  home.file = {
    ".config/alacritty/alacritty.yml".text = ''
      font:
        normal:
          family: JetBrainsMono Nerd Font
          style: Regular

        bold:
          family: JetBrainsMono Nerd Font
          style: Bold

        italic:
          family: JetBrainsMono Nerd Font
          style: Italic

        bold_italic:
          family: JetBrainsMono Nerd Font
          style: Bold Italic

      key_bindings:
        - { key: C, mods: Command|Shift, action: "Copy" }
        - { key: C, mods: Command, chars: "\x03" }
        - { key: V, mods: Command|Shift, action: "Paste" }
        - { key: U, mods: Command, chars: "\x15" }
        - { key: L, mods: Command, chars: "\x0c" }
    '';
  };
}
