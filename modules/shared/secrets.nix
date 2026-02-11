{pkgs, config, inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  environment.systemPackages = with pkgs; [
    age
    sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/brennen.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/brennen/.config/sops/age/keys.txt";
    age.sshKeyPaths = [ "/home/brennen/.ssh/id_ed25519" ]; 
    
    secrets.git_key = { };
  };
}
