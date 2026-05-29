{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
    # Tools
		git
		gcc
    wget
    fastfetch
    postgresql
    age
    sops
    tmux
    starship
    jujutsu

    # Languages
    ## Rust
    rustc
    cargo

    ## Python
    python3

    ## Zig
		zig

    ## Go
    go

    ## Odin
    odin

    # Gleam
    # erlang_26
    # gleam
    # rebar3

    # Lua
    lua

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
