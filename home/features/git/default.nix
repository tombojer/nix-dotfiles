{ pkgs, ... }: {

  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;
    package = pkgs.git;
    lfs = {
      enable = true;
    };

    userName = "Tom Bojer";
    userEmail = "t.bojer@shopware.com";

    signing.key = "ssh-rsa ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpdZ9NEZF6nf5s9rx+LLW/QAosghrsuC1gmZA0YSezx";
    signing.signByDefault = true;

    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      push.default = "simple";
      fetch.prune = true;

      gpg.format = "ssh";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      git = {
        overrideGpg = true;
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };

  home.file = {
    ".ssh/allowed_signers".text = "t.bojer@shopware.com namespaces=\"git\" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpdZ9NEZF6nf5s9rx+LLW/QAosghrsuC1gmZA0YSezx";
  };
}
