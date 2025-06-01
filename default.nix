{ lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    eza
    graphicsmagick-imagemagick-compat # convert file.jpg -quality 50% file.small.jpg
    poppler_utils
  ];

  imports = [ ./base.nix ./typography.nix ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11" # feishin
  ];

  # https://nixos.org/manual/nixos/stable/options#opt-system.activationScripts
  system.activationScripts.flatpakApps =
    let
      flatpak = "/run/current-system/sw/bin/flatpak";
      install = "${flatpak} install --or-update --assumeyes --noninteractive";
    in
    # /var/lib/flatpak/exports/share/applications/
    builtins.concatStringsSep " &&" [
      "${install} flathub re.sonny.Eloquent"
      # "${install} flathub net.waterfox.waterfox"
      # "${install} flathub app.zen_browser.zen"
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
      go
      hugo
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
