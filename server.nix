{ lib, pkgs, ... }:

{
  imports = [ ./base.nix ./www-data.nix ];

  # Para usar o VS Code via SSH
  programs.nix-ld.enable = true;

  services.mysql.ensureUsers = [{
    name = "almino";
    ensurePermissions."*.*" = "ALL";
  }];

  users.users.almino = {
    isNormalUser = lib.mkDefault true;
  };
}
