{ lib, pkgs, ... }:

{
  imports = [ ./base.nix ./typography.nix ];

  users.users.almino = {
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [
      librewolf
      nextcloud-client
      niv
      sigil
      zotero
    ];
  };
}
