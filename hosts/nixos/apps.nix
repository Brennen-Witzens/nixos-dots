{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  # Tools?
    git

  # Languages and related items
      cargo
      rustc
      gcc
      zig

  # Ricing stuff
      rofi
      xwallpaper
  ];
}
