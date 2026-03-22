{ lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    eza
    gajim
    graphicsmagick-imagemagick-compat # convert file.jpg -quality 50% file.small.jpg
    hacompanion
    meld
    poppler-utils
    shfmt
    uget # gerenciador de downloads
    uget-integrator
    vivaldi
  ];

  imports = [ ./base.nix ./typography.nix ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5" # feishin
  ];

  # programs.firefox = {
  #   enable = true;
  #   nativeMessagingHosts = {
  #     packages = with pkgs.unstable; [
  #       firefoxpwa
  #       uget-integrator
  #     ];
  #     ugetIntegrator = true;
  #   };
  # };

  systemd.user.timers.flatpak-apps = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "flatpak-apps.service";
    };
  };

  systemd.user.services.flatpak-apps = {
    description = "Install and update Flatpak apps";
    serviceConfig = {
      ExecStart = let
        flatpak = "${pkgs.flatpak}/bin/flatpak";
        install = "${flatpak} install --or-update --assumeyes --noninteractive";
      in
        builtins.concatStringsSep "\n" [
          "${install} flathub re.sonny.Eloquent"
          # "${install} flathub net.waterfox.waterfox"
          # "${install} flathub app.zen_browser.zen"
          # "${install} flathub net.codelogistics.webapps"
        ];
      Type = "oneshot";
    };
  };

  users.users.almino = {
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [
      calibre
      drawio
      feishin
      firefoxpwa
      go
      hugo
      # librewolf # muito fresco pra configurações
      minder
      nextcloud-client
      niv
      ocrmypdf
      obsidian
      pandoc
      sigil
      temurin-jre-bin-17
      zotero
    ];
  };
}
