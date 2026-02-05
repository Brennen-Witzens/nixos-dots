{
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    registry = {
	n.flake = inputs.nixpkgs;
	};
   nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
   gc = {
	automatic = true;
	options = "--delete-older-than 3d";
	};

   settings = {
	experimental-features = [
		"nix-command"
		"flakes"
	   ];
	};

   warn-dirty = false;
   build-users-group = "nixbld";
   trusted-users = [ "brennen" ];

  };
}
