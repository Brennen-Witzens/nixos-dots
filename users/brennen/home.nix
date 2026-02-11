{ config, ... }:

let
dotfiles = "${config.home.homeDirectory}/nixos-dots/config";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
# TODO: Add more configs to this list
# Ghostty/Wezterm
# Nvim
# etc
configs = {
  qtile = "qtile";
  wezterm = "wezterm";
  nvim = "nvim";
  oxwm = "oxwm";
  ghostty = "ghostty";
  tmux = "tmux";
  rofi = "rofi";
  helix = "helix";
};
in

{
    imports = [
      ../../home/core.nix
      ../../home/programs
    ];
    
    xdg.configFile = builtins.mapAttrs (name: subpath: {
	    source = create_symlink "${dotfiles}/${subpath}";   
	    recursive = true;
    }) configs;
}
