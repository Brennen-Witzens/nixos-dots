{config, ... }:
{

  
  sops.defaultSopsFile = ../../../secrets/brennen.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/brennen/.config/sops/age/keys.txt";
  sops.age.sshKeyPaths = [ "/home/brennen/.ssh/id_ed25519" ]; 

  sops.secrets.git_key = { };

}
