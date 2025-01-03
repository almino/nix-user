{ lib, pkgs, ... }:

{
  imports = [ ./base.nix ];

  users.users.almino = {
    description = "Almino";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [
      eza
      gh
      librewolf
      nextcloud-client
      niv
      sigil
      zotero
    ];
    shell = lib.mkForce pkgs.fish;
  };
}
