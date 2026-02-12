{
pkgs,
me,
lib,
...
}:
{
  imports = [
    ../../modules/shared/system
  ];

  networking.hostName = "wsl";

  wsl = {
    enable = true;
    defaultUser = "brennen";
    useWindowsDriver = true;
  };

  environment = {
    systemPackages = with pkgs; [
    ];
  };

  system.stateVersion = "25.11";
}
