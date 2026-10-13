{ pkgs, ... }:
{
  config = {
    # Packages installed locally for the user
    home.packages = with pkgs; [
      yubioath-flutter
      yubikey-manager
      yubikey-personalization
      pinentry-rofi
    ];

    # Manage GPG and SSH agent integration via Home Manager
    programs.gpg = {
      enable = true;
    };

    programs.ssh = {
      matchBlocks = {
        "*" = {
          identityFile = "~/.ssh/yubikey.pub";
          extraOptions = {
            AddKeysToAgent = "yes";
            # Permet d'accepter et d'enregistrer automatiquement la nouvelle empreinte du serveur sans demander confirmation
            StrictHostKeyChecking = "accept-new";
          };
        };
      };
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentry.package = pkgs.pinentry-gnome3; # or pkgs.pinentry-gnome3 / pinentry-qt for a GUI popup
      defaultCacheTtl = 86400; # seconds; cache passphrase for a day
      maxCacheTtl = 86400;
    };

    # Disable ssh-agent in favor of gpg-agent
    # ssh-add keeps working as usual (as long as SSH_AUTH_SOCK is set to the gpg-agent, which the gnupg module does)
    # programs.ssh.startAgent = false;

    # Ensure SSH_AUTH_SOCK points to the GPG agent socket
    home.sessionVariables = {
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh";
    };
  };
}
