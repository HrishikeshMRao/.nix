{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/nix/hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../../modules/nix/main-user.nix
  ];

  main-user = {
    enable = true;
    userName = "fiend";
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    grub.device = "/dev/sda";
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.

    # Pick only one of the below networking options.

    # Enables wireless support via wpa_supplicant.
    wireless.enable = true;
    # Easiest to use and most distros use this by default.
    # networking.networkmanager.enable = true;

    # disable the firewall altogether.
    firewall.enable = false;
  };

  # Set your time zone.
  time.timeZone = "India/Kolkata";

  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = false;
      displayManager.gdm.enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us";
        options = "eurosign:e,caps:escape";
      };
    };

    #Enable CUPS to print
    printing.enable = true;

    #sound
    pipewire.enable = true;

    # Enable touchpad support
    #(enabled default in most desktopManager).
    libinput.enable = true;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    #BlueTooth
    blueman.enable = true;
  };

  ############################# Flakes ##############################

  nix = {

    #Garbage Collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };

    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

  };
  ####################################################################

  environment = {

    # List packages installed in system profile.
    # To search, run:
    systemPackages = with pkgs; [
      vim
      wget
      git
      kitty
      waybar
      swww
      rofi-wayland
      home-manager
    ];

    variables.EDITOR = "nvim";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {

    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    regreet.enable = true;

  };

  system.stateVersion = "24.05";

  security.rtkit.enable = true;

  ######################## ################################

  hardware = {

    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };

  };

  ######################### Home-Manager #############################

  home-manager = {

    extraSpecialArgs = {
      inherit inputs;
    };

    users = {
      fiend = import ./home.nix;
    };

  };

  ########################## DeskTop Portal ##########################

  #xdg.portal.enable = true;
  #xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-wlr];
  #xdg.portal.config.common.default = "*";

}
