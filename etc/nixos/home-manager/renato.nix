{ config, pkgs, ... }:

{
  home = {
    username = "renato";
    homeDirectory = "/home/renato";

    packages = with pkgs; [
      waybar
      neovim
      git
      fzf

      # Fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.lilex

      kitty
      firefox
      fuzzel
    ];
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
