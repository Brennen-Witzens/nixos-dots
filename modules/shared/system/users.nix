{
  users.users.brennen = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../../keys/ssh.pub)
    ];
  };
}
