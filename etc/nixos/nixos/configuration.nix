{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  boot = {
    supportedFilesystems = [ "btrfs" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
  ];

  programs = {
    sway = {
     enable = true;
     extraPackages = with pkgs; [
       waybar
       grim
       brightnessctl
       slurp
       wl-clipboard
       mako
       fuzzel
     ];
    };
    fish = {
      enable = true;
    };
    goldwarden = {
      enable = true;
      useSshAgent = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true; 
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };

  services = {
    displayManager.ly = {
      enable = true;
    };
    openssh = {
      enable = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
  };

  users = {
    mutableUsers = true;
    users = {
      root = {
        hashedPasswordFile = "/nix/persist/paysandu";
      };
      renato = {
        createHome = true;
        isNormalUser = true;
	shell = pkgs.fish;
        extraGroups = [ "wheel" ];
        group = "users";
	hashedPasswordFile = "/nix/persist/paysandu";
      };
    };
  };

  security = {
    doas = {
      enable = true;
      extraRules = [
        { groups = ["wheel"]; keepEnv = true; persist = true; }
      ];
    };
    sudo = {
      enable = false;
    };
  };

  networking = {
    hostName = "nixos";
    useDHCP = lib.mkDefault true;
  };

  time.timeZone = "America/Belem";

  system.stateVersion = "24.11";
}
