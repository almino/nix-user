{ lib, pkgs, ... }:

{
  imports = [
    ./apps/direnv.nix
    ./apps/fish.nix
    ./apps/tmux.nix
    ./www-data.nix
  ];

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
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ eza gh ];
    shell = lib.mkForce pkgs.fish;
  };
}
