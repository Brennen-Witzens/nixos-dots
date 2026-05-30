{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../modules/shared/system
    /etc/nixos/hardware-configuration.nix
    ./apps.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.initrd.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.windows = {
    "Windows" = {
      title = "Windows 11";
      efiDeviceHandle = "HD0d65535a3";
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.loader.systemd-boot.edk2-uefi-shell.enable = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  #TODO: Change display manager and window manager later
  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.qtile.enable = true;
    windowManager.oxwm.enable = true;
    displayManager.sessionCommands = ''
      xwallpaper --zoom ~/nixos-dots/walls/walls1.jpg
    '';
    videoDrivers = [ "amdgpu" ];
    enableTearFree = true;
    resolutions = [
      {
        x = 1920;
        y = 1080;
      }
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
    };
  };

  services.udisks2.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #users.users.brennen = {
  #  isNormalUser = true;
  #  extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #  packages = with pkgs; [
  #    tree
  #  ];
  #  openssh.authorizedKeys.keys = [
  #    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHFdOKp7ztawqNqUOsIX+8MA/Cwi5D+YzK9GGz1vqX8T bwitzen@gmail.com"
  #  ];
  #};

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    ghostty
    wezterm
    rofi
    firefox
  ];

  #TODO: Add more fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11";
}
