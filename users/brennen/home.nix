{ config, inputs, ... }:

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
    programs.home-manager.enable = true;
    imports = [
      ../../modules/shared/home
      ./programs
    ];

    home =
    {
      username = "brennen";
      homeDirectory = "/home/brennen";
      stateVersion = "25.11";
      sessionVariables = {
        EDITOR = "nvim";
      };
    };


    xdg.configFile = builtins.mapAttrs (name: subpath: {
	    source = create_symlink "${dotfiles}/${subpath}";   
	    recursive = true;
    }) configs;
}
