{ lib, pkgs, ... }:

{
  imports = [ ./base.nix ./www-data.nix ];

  services.mysql.ensureUsers = [{
    name = "almino";
    ensurePermissions."*.*" = "ALL";
  }];

  users.users.almino = {
    description = "Almino";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    isNormalUser = lib.mkDefault true;
  };
}
