{
  programs.bash = {
    enable = true;
    shellAliases = {
      nrsi = "sudo nixos-rebuild switch --impure --flake .#nixos";
      nrsw = "sudo nixos-rebuild switch --flake .#wsl";
      nrsl = "sudo nixos-rebuild switch --impure --flake .#laptop";
    };
    bashrcExtra = ''eval "$(starship init bash)"'';
  };
}
