{ lib, pkgs, ... }:

{
  imports = [ ./me.nix ../base/gnome-dconf.nix ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Terminal.desktop"
      ];
    };
  };
}
