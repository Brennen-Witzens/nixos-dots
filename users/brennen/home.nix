{ config, pkgs, ... }:

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
    ];

    home.username = "brennen";
    home.homeDirectory = "/home/brennen";
    home.stateVersion = "25.11";
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo i use nixos, btw";
        };
    };
  
    programs.git = {
      enable = true;
      settings.user = {
        name = "Brennen Witzens";
        email = "bwitzen@gmail.com";
      };
    };

    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
          userKnownHostsFile = "~/.ssh/known_hosts";
        };
      };
    };

    home.packages = with pkgs; [
	# Rust Install and Dependencies
        cargo
        rustc
        gcc
        zig
        wezterm
        tmux
        rofi
        xwallpaper
        helix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    xdg.configFile = builtins.mapAttrs (name: subpath: {
	    source = create_symlink "${dotfiles}/${subpath}";   
	    recursive = true;
    }) configs;
}
