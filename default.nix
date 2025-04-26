{ lib, pkgs, ... }:

{
  imports = [ ./base.nix ./typography.nix ];

  # https://nixos.org/manual/nixos/stable/options#opt-system.activationScripts
  system.activationScripts.flatpakApps =
    let
      flatpak = "/run/current-system/sw/bin/flatpak";
      install = "${flatpak} install --or-update --assumeyes --noninteractive";
    in
    builtins.concatStringsSep " &&" [
      "${install} flathub re.sonny.Eloquent"
      "${install} flathub net.waterfox.waterfox"
      "${install} flathub app.zen_browser.zen"
      "${install} flathub net.codelogistics.webapps"
    ];

  users.users.almino = {
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [
      # dia # diagramas (não gostei)
      drawio
      feishin
      firefoxpwa
      # librewolf # muito fresco pra configurações
      minder
      nextcloud-client
      niv
      obsidian
      pandoc
      sigil
      zotero
    ];
  };
}
