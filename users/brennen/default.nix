{config, ... }:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.brennen = ../users/brennen/home.nix;
      backupFileExtension = "backup";

    };
  };
}
