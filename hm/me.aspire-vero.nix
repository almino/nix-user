{ lib, pkgs, ... }:

{
  imports = [ ./me.nix ../base/gnome-dconf.nix ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "google-chrome.desktop"
        "org.gnome.Terminal.desktop"
      ];
      enabled-extensions = [
        "advanced-alt-tab@G-dH.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "expandable-notifications@kaan.g.inam.org"
        "one-thing@github.com"
        "pano@elhan.io"
        "pomodoro@arun.codito.in"
        "space-bar@luchrioh"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
      ];
    };
  };

  home.file.ssh = {
    source = ../dotfiles/lenovo-laptop.ssh.config;
    target = ".ssh/config";
  };

  programs.firefox.enable = true;
  programs.firefox.profiles = {
    personal = (import ../apps/firefox/personal.nix
      { inherit lib pkgs; }) // {
      id = 0;
      isDefault = true;
    };
    work = (import ../apps/firefox/work.nix
      { inherit lib pkgs; }) // {
      id = 1;
      isDefault = false;
    };
  };
}
