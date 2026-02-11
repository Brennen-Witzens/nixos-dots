{
  description = "NixOS from Scratch";

  inputs = {
# Stable Nixpkgs
    nixpkgs.url = "nixpkgs/nixos-25.11";

# Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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

# OXWM-btw
    oxwm = {
      url = "github:tonybanters/oxwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  outputs = {
      nixpkgs,
      home-manager,
      oxwm,
      nixos-wsl, 
      sops-nix,
      ...
  }@inputs: {
    nixosConfigurations = {
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/wsl
          ./users/brennen/nixos.nix
          sops-nix.nixosModules.sops
          nixos-wsl.nixosModules.default
          home-manager.nixosModules.home-manager
          { 
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brennen = import ./users/brennen/home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };

        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
              ./hosts/nixos
              ./users/brennen/nixos.nix
              oxwm.nixosModules.default
              sops-nix.nixosModules.sops
              home-manager.nixosModules.home-manager
              #{
              #  home-manager.useGlobalPkgs = true;
              #  home-manager.useUserPackages = true;
              #  home-manager.users.brennen = import ./users/brennen/home.nix;
              #  home-manager.backupFileExtension = "backup";
              #}
          ];
        };
    };
  };
}
