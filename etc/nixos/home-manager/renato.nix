{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "renato";
    homeDirectory = "/home/renato";

    packages = with pkgs; [
      neovim
      git
      fzf
      bat
      ripgrep
      btop

      # Fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.lilex

      kitty
      pavucontrol
      firefox
      goldwarden

      go
      biome
      gnumake
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };
  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = null;
      extraConfig = ''
        pinentry-program /home/renato/.local/bin/pinentry-fuzzel
      '';
    };
  };

  home.stateVersion = "24.11";
}
