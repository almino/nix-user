# /run/current-system/sw/share/applications
{ config, lib, pkgs, ... }:

{
  xdg.enable = lib.mkDefault true;
  xdg.desktopEntries.work = {
    categories = [
      "Office"
    ];
    comment = "Janelas para trabalhar na UFC";
    exec = "tmux new -d -s work " + ./work.sh;
    icon = ./icons/work.png;
    name = "Trabalho na UFC";
    settings = {
      Keywords = builtins.concatStringsSep ";" [
        "trabalhar" "work"
      ];
      SingleMainWindow = "false";
      X-GNOME-SingleWindow = "true";
      X-GNOME-UsesNotifications = "true";
    };
    startupNotify = false;
    terminal = true;
  };
}
