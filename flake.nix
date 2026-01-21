{
    description = "NixOS from Scratch";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	oxwm = {
		url = "github:tonybanters/oxwm";
		inputs.nixpkgs.follows = "nixpkgs";
	};
    };

        outputs = { self, nixpkgs, home-manager, oxwm, ...}: {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem
            {
          system = "x86_64-linux";
          modules = [
              ./configuration.nix
		  oxwm.nixosModules.default
                  home-manager.nixosModules.home-manager
                  {
         home-manager = {
             useGlobalPkgs = true;
             useUserPackages = true;
             users.brennen = import ./home.nix;
             backupFileExtension = "backup";
         };
        }
      ];
    };
  };
}
