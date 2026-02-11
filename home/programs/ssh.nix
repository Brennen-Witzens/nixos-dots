{config, ...}:
let
  inherit (config.sops) secrets;
in
{

  assertions = [
    { 
      assertion = config ? sops;
      message = " failed to load nix sops?";
    }
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        userKnownHostsFile = "~/.ssh/known_hosts";
        identityFile = secrets.git_key.path;
      };
    };

    "github.com" = { 
      user = "git";
      homename = "github.com";
      identityFile = secrets.git_key.path;
    };
  };

  
}
