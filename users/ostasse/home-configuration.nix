{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ostasse";
  home.homeDirectory = "/home/ostasse";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.htop
    pkgs.fortune
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ostasse/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
      epkgs.ac-ispell
      epkgs.all-the-icons
      epkgs.auctex
      epkgs.auto-complete
      epkgs.citar-embark
      epkgs.citar-org-roam
      epkgs.citar
      epkgs.citeproc-org
      epkgs.cmake-font-lock
      epkgs.cmake-mode
      epkgs.company
      epkgs.dap-mode
      epkgs.bui
      epkgs.dashboard-project-status
      epkgs.dashboard
      epkgs.ebib
      epkgs.eglot-jl
      epkgs.embark
      epkgs.exec-path-from-shell
      epkgs.flycheck-aspell
      epkgs.flycheck-rust
      epkgs.flycheck
      epkgs.git
      epkgs.google-c-style
      epkgs.grip-mode
      epkgs.helm-bibtex
      epkgs.helm-lsp
      epkgs.helm-xref
      epkgs.helm
      epkgs.helm-core
      epkgs.async
      epkgs.ivy-bibtex
      epkgs.lsp-docker
      epkgs.lsp-ivy
      epkgs.ivy
      epkgs.lsp-treemacs
      epkgs.lsp-ui
      epkgs.lsp-mode
      epkgs.magit
      epkgs.git-commit
      epkgs.marginalia
      epkgs.markdown-preview-eww
      epkgs.markdown-preview-mode
      epkgs.monokai-theme
      epkgs.nix-mode
      epkgs.ob-mermaid
      epkgs.openwith
      epkgs.orderless
      epkgs.org-brain
      epkgs.org-drill
      epkgs.org-gcal
      epkgs.elnode
      epkgs.db
      epkgs.fakir
      epkgs.creole
      epkgs.kv
      epkgs.noflet
      epkgs.alert
      epkgs.log4e
      epkgs.gntp
      epkgs.aio
      epkgs.org-journal
      epkgs.org-journal-list
      epkgs.org-ql
      epkgs.org-ref
      epkgs.citeproc
      epkgs.htmlize
      epkgs.org-roam-bibtex
      epkgs.bibtex-completion
      epkgs.biblio
      epkgs.biblio-core
      epkgs.org-roam
      epkgs.emacsql
      epkgs.org-super-agenda
      epkgs.ov
      epkgs.ox-pandoc
      epkgs.parsebib
      epkgs.persist
      epkgs.pkg-info
      epkgs.epl
      epkgs.plantuml-mode
      epkgs.poly-org
      epkgs.popup
      epkgs.projectile
      epkgs.pyenv-mode
      epkgs.pythonic
      epkgs.f
      epkgs.quarto-mode
      epkgs.poly-markdown
      epkgs.markdown-mode
      epkgs.polymode
      epkgs.quelpa-use-package
      epkgs.quelpa
      epkgs.queue
      epkgs.request-deferred
      epkgs.request
      epkgs.deferred
      epkgs.rust-mode
      epkgs.spinner
      epkgs.string-inflection
      epkgs.svg-lib
      epkgs.taxy-magit-section
      epkgs.taxy
      epkgs.magit-section
      epkgs.llama
      epkgs.cond-let
      epkgs.transient
      epkgs.treemacs
      epkgs.cfrs
      epkgs.posframe
      epkgs.ht
      epkgs.hydra
      epkgs.lv
      epkgs.pfuture
      epkgs.ace-window
      epkgs.avy
      epkgs.ts
      epkgs.typescript-mode
      epkgs.notmuch
      epkgs.ol-notmuch
      epkgs.use-package
      epkgs.bind-key
      epkgs.consult
      epkgs.vertico
      epkgs.web
      epkgs.s
      epkgs.dash
      epkgs.web-server
      epkgs.websocket
      epkgs.wfnames
      epkgs.which-key
      epkgs.with-editor
      epkgs.yaml
      epkgs.yasnippet
    ];
  };

  programs.chromium = {
    enable = true;
    package = pkgs.chromium;

    # Pass command line flags
    commandLineArgs = [
      "--enable-logging=stderr"
      "--ignore-gpu-blocklist"
    ];

    # Install extensions via CRX ID strings
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
    ];
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;  # or pkgs.pinentry-gnome3 / pinentry-qt for a GUI popup
    defaultCacheTtl = 86400;   # seconds; cache passphrase for a day
    maxCacheTtl = 86400;
  };

    # pass itself
  programs.password-store = {
    enable = true;
    settings.PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
  };

  # mbsync + notmuch, tied to your account declaratively
  accounts.email.accounts."laas" = {
    primary = true;
    address = "ostasse@laas.fr";
    userName = "ostasse";
    realName = "Olivier Stasse";
    passwordCommand = "pass show email/ostasse@laas.fr";

    imap = {
      host = "imap.laas.fr";   # replace with your actual IMAP host
      port = 993;
      tls.enable = true;
    };

    mbsync = {
      enable = true;
      create = "maildir";
      expunge = "both";
    };

    notmuch.enable = true;
  };

  systemd.user.services.mbsync = {
    Unit.Description = "mbsync";
    Unit.After = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.isync}/bin/mbsync -a";
      ExecStartPost = "${pkgs.notmuch}/bin/notmuch new";
    };
  };

  systemd.user.timers.mbsync = {
    Unit.Description = "Run mbsync every 5 minutes";
    Timer = {
      OnBootSec = "1min";
      OnUnitActiveSec = "5min";
    };
    Install.WantedBy = [ "timers.target" ];
  };

  accounts.email.accounts."laas" = {
    # ... your existing primary/address/userName/passwordCommand/imap settings stay as-is

    smtp = {
      host = "smtp.laas.fr";   # check your actual SMTP host — likely in Thunderbird's Server Settings > Outgoing Server
      port = 465;               # 587 (STARTTLS) is most common; some servers use 465 (implicit TLS, like IMAP's 993)
      tls.enable = true;
      # tls.useStartTls = true;  # uncomment if port 587/STARTTLS rather than 465/implicit
    };

    msmtp.enable = true;
  };
  
  programs.msmtp.enable = true;
  programs.mbsync.enable = true;
  programs.notmuch = {
    enable = true;
    search.excludeTags = [ "deleted" "delete" "spam"];
  };  

}
