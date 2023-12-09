{ lib, pkgs, ... }:

{
  users.users.almino = {
    description = "Almino Melo";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ eza gh ];
    shell = lib.mkForce pkgs.fish;
  };
}
