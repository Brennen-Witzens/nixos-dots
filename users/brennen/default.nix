{config, inputs, ... }:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.brennen = ./home.nix;
      backupFileExtension = "backup";

      sharedModules = [
        inputs.sops-nix.homeManagerModules.sops
      ];
    };
  };
}
