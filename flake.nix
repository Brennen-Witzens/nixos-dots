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
# Flake Management
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    }; 

# Easy Hosts
    easy-hosts = {
      url = "github:tgirlcloud/easy-hosts";
    };
  };


  outputs = {
      nixpkgs,
      home-manager,
      oxwm,
      ...
  }: {
    nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hosts/wsl
            ./users/nixos.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.users.brennen = import ./users/home.nix;
                home-manager.backupFileExtension = "backup";
              }
          ];
        };

        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
              ./hosts/nixos
              ./users/nixos.nix
              oxwm.nixosModules.default

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.brennen = import ./users/home.nix;
                home-manager.backupFileExtension = "backup";
              }
          ];
        };
    };
  };
}
