{
  home = {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;
    users.brennen = import ./users/brennen/home.nix;
    backupFileExtension = "backup";

    username = "brennen";
    homeDirectory = "/home/brennen";
    stateVersion = "25.11";
#programs.bash = {
#  enable = true;
#  shellAliases = {
#    btw = "echo i use nixos, btw";
#  };
#};

    home.sessionVariables = {
      EDITOR = "nvim";
    };

  };
  programs.home-manager.enable = true;
}
