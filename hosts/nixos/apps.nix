{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Ricing stuff
    rofi
    xwallpaper
    kdePackages.dolphin # Dolphin file explorer
    kdePackages.qtsvg # icons for file explorer
    ladybird
  ];
}
