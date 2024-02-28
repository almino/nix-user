{ lib, pkgs, ... }:

let vars = import ../../vars.nix; in
{
  imports = [ ./apps/fish.nix ];

  users.users.almino = {
    description = "Almino";
    extraGroups = [
      "networkmanager"
      "wheel"
      vars.webGroup
    ];
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ eza ];
    shell = lib.mkForce pkgs.fish;
  };
}
