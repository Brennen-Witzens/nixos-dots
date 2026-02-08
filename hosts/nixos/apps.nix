{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Ricing stuff
    rofi
    xwallpaper
  ];
}
