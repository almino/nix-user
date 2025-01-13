{ lib, pkgs, ... }:

{
  imports = [ ./base.nix ./www-data.nix ];

  services.mysql.ensureUsers = [{
    name = "almino";
    ensurePermissions."*.*" = "ALL";
  }];

  users.users.almino = {
    description = "Almino";
    isNormalUser = lib.mkDefault true;
  };
}
