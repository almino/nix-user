{ lib, ... }:

{
  imports = [ ./default.nix ];

  services.xserver.displayManager.gdm.settings = {
    greeter = {
      Exclude = builtins.concatStringsSep "," [
        "almino"
        "dti"
      ];
      IncludeAll = lib.mkDefault false;
    };
  };

  users.users.almino = {
    createHome = lib.mkDefault true;
    extraGroups = [ "networkmanager" "wheel" ];
    group = lib.mkDefault "users";
    home = lib.mkDefault "/home/almino";
    initialPassword = lib.mkDefault "123456";
    isNormalUser = lib.mkForce false;
    isSystemUser = lib.mkDefault true;
  };
}
