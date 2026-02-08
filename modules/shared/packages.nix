{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
    # Tools
		git
		gcc
    wget
    fastfetch
    postgresql

    # Languages
		rustc
		cargo
		zig

    # TUI
		neovim
    helix

    # LSPs and Dependencies
    nil # Nix lsp
    rust-analyzer # Rust lsp
    zls # Zig lsp
    lua-language-server # lua lsp
    nixpkgs-fmt # nix formatter
    nodejs # needed for lazy.nvim but other things as well
    ripgrep
    fd
    fzf
	];
}
