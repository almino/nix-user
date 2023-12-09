# /run/current-system/sw/share/applications
{ config, lib, pkgs, ... }:

let dir = builtins.concatStringsSep "/" [
  "${config.home.homeDirectory}"
  ".local" "share" "TelegramDesktop981"
]; in

let exec = [
  "${pkgs.telegram-desktop}/bin/telegram-desktop"
  "--class=\"TelegramDesktop981\""
  "--name=\"Telegram X\""
  "-workdir" dir
]; in

{
  home.activation = {
    telegram981 = lib.hm.dag.entryAfter
      ["writeBoundary"] (builtins.toString [
      "\$DRY_RUN_CMD" "mkdir" "-p" dir
    ]);
  };

  xdg.enable = lib.mkDefault true;
  xdg.desktopEntries.telegram981 = {
    categories = [
      "Chat"
      "InstantMessaging"
      "Network"
      "Qt"
    ];
    comment = "Versão oficial para computadores "
      + "do aplicativo de mensagens Telegram";
    exec = builtins.toString (
      exec ++ [ "--" "%u" ]
    );
    icon = ./telegramX.png;
    name = "Telegram X";
    settings = {
      Keywords = builtins.concatStringsSep ";" [
        "tg" "chat" "im" "messaging" "messenger"
        "sms" "tdesktop" "tx" "tgx"
      ];
      MimeType = "x-scheme-handler/tg";
      Path = dir;
      SingleMainWindow = "true";
      StartupWMClass = "TelegramDesktop981";
      X-GNOME-SingleWindow = "true";
      X-GNOME-UsesNotifications = "true";
    };
    startupNotify = false;
    terminal = false;
  };
}