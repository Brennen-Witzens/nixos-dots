{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		git
		neovim
		wezterm
		gcc
		rustc
		cargo
		zig
	];
}
