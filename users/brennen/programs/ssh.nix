{ config, ... }:
let
  inherit (config.sops) secrets;
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        addKeysToAgent = "yes";
        userKnownHostsFile = "~/.ssh/known_hosts";
        identityFile = secrets.git_key.path;
      };
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = config.sops.secrets.git_key.path;
      };
      "codeberg.org" = {
        user = "git";
        hostname = "codeberg.org";
        identityFile = config.sops.secrets.git_key.path;
      };
    };
    # matchBlocks = {
    #   "*" = {
    #     addKeysToAgent = "yes";
    #     userKnownHostsFile = "~/.ssh/known_hosts";
    #     identityFile = secrets.git_key.path;
    #   };
    #   "github.com" = {
    #     user = "git";
    #     hostname = "github.com";
    #     identityFile = config.sops.secrets.git_key.path;
    #   };
    #   "codeberg.org" = {
    #     user = "git";
    #     hostname = "codeberg.org";
    #     identityFile = config.sops.secrets.git_key.path;
    #   };
    # };
  };
}
