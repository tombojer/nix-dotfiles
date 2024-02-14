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
        set DIR (zoxide query -l | fzf)
        z $DIR
      '';
      t = ''
        tmux attach -t "$(tmux ls -F '#{session_name}:#{window_name}' | fzf)"
      '';
      awsx = ''
        set -gx AWS_PROFILE (aws configure list-profiles | fzf)
        echo "Using profile: $AWS_PROFILE"
      '';
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      aws.disabled = true;
      gcloud.disabled = true;
      git_status.disabled = true;
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
    "cat" = "bat -pp";
  };

  home.file = {
    ".config/alacritty/alacritty.toml".text = ''
[font.bold]
family = "JetBrainsMono Nerd Font"
style = "Bold"

[font.bold_italic]
family = "JetBrainsMono Nerd Font"
style = "Bold Italic"

[font.italic]
family = "JetBrainsMono Nerd Font"
style = "Italic"

[font.normal]
family = "JetBrainsMono Nerd Font"
style = "Regular"

[[keyboard.bindings]]
action = "Copy"
key = "C"
mods = "Command|Shift"

[[keyboard.bindings]]
chars = "\u0003"
key = "C"
mods = "Command"

[[keyboard.bindings]]
action = "Paste"
key = "V"
mods = "Command|Shift"

[[keyboard.bindings]]
chars = "\u0015"
key = "U"
mods = "Command"

[[keyboard.bindings]]
chars = "\f"
key = "L"
mods = "Command"

[[keyboard.bindings]]
chars = "\u001Bb"
key = "Left"
mods = "Control"

[[keyboard.bindings]]
chars = "\u001Bf"
key = "Right"
mods = "Control"

[[keyboard.bindings]]
chars = "\u001BOH"
key = "Left"
mode = "AppCursor"
mods = "Command"

[[keyboard.bindings]]
chars = "\u001BOF"
key = "Right"
mode = "AppCursor"
mods = "Command"

[[keyboard.bindings]]
chars = "\u0015"
key = "Back"
mods = "Command"

[[keyboard.bindings]]
chars = "\u001B\u007F"
key = "Back"
mods = "Control"
    '';
  };
}
