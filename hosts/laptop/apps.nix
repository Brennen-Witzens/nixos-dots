{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Ricing stuff
    rofi
    #Hyprland
    hyprpaper
    hyprlauncher
    hyprlock
    hypridle

    
    xwallpaper
    kdePackages.dolphin # Dolphin file explorer
    kdePackages.qtsvg # icons for file explorer


    # Niri
    alacritty
    fuzzel
    swaybg
    xwayland-satellite
  ];
}
