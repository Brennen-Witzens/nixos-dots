{ config, pkgs, lib, ... }:

{
	# Install Neovim and dependences
	home.packages = with pkgs; [
	# Tools required for Telescope
	ripgrep
	fd
	fzf

	# Language Servers
	lua-language-server # Lua lsp
  stylua
	nil # nix language server
	nixpkgs-fmt # nix formatter
	rust-analyzer # Rust lsp
	zls # Zig lsp

	# Needed for Lazy.nvim
	nodejs
	];

	programs.neovim = {
		enable = true;
	};
}
