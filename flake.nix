{
  description = "NixOS from Scratch";

  inputs = {
    # Stable Nixpkgs
    # nixpkgs.url = "nixpkgs/nixos-25.11";
    # Unstable Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    # home-manager = {
    #   url = "github:nix-community/home-manager/release-25.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # Home Manager Unstable
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS-WSL
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
      };
    };

# Sops Nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-wsl,
      sops-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/wsl
            ./users/brennen/nixos.nix
            ./users/brennen/default.nix
            sops-nix.nixosModules.sops
            nixos-wsl.nixosModules.default
            home-manager.nixosModules.home-manager
          ];
        };

        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nixos
            ./users/brennen/nixos.nix
            ./users/brennen/default.nix
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
