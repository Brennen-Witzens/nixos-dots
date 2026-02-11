{
  config = {
    sops = {
      defaultSopsFile = "../../secrets/brennen.yaml";
      age.keyFile = "~/.config/sops/age/keys.txt";
      age.sshKeyPaths = [ "~/.ssh/personal_key" ];
    };
  };
}
