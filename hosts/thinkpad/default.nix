# TODO: Modify this after writing system.nix..
# TODO: Browser needed (put that shit in modules)
# TODO: display stuff
# TODO: system.stateVersion = 25.11
# TODO: WHERE DO I PUT NETWORK MANAGER AND WHEEL

{ config, pkgs, lib,  ... }:

{
  # Import NixOS modules
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Configure nixpkgs
  nixpkgs = {
    config = {
      allowUnfree = true; # allow unfree packages
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };

    channel.enable = false;
  };


  # Bootloader TODO: GOOD LOOKS THIS SHOULD BE HERE
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname & networking
  networking.hostName = "chohept"; # Define your hostname.
  networking.networkmanager.enable = true;

  # TODO: I can probably move this
  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define all user accounts
  users.users = {
    vicky = {
      isNormalUser = true;
      description = "Vicky";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };
  };

  # TODO: move this to home and use a WM
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "plasma";
  };


  # Add support for second monitor
  # TODO: change this this sucks
  services.xserver.displayManager.sessionCommands = ''
      ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';

  services.desktopManager.plasma6.enable = true;

  # Configure video drivers for displaylink
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable displaylink server
  systemd.services.displaylink-server = {
    enable = true;
    requires = [ "systemd-udevd.service" ];
    after = [ "systemd-udevd.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.displaylink}/bin/DisplayLinkManager";
      User = "root";
      Group = "root";
      Restart = "on-failure";
      RestartSec = 5; # Wait 5 seconds before restarting
    };
  };

  # Do not suspend if plugged in and lid is closed
  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

  
  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    displaylink # multiple monitor support 
 ];

  environment.variables.EDITOR = "vim";

  environment.variables = {
    KWIN_DRM_PREFER_COLOR_DEPTH = "24";
  };

  system.stateVersion = "25.11";
}
