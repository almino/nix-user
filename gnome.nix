{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    gnome.gnome-terminal
    gnome.gnome-tweaks
    gnomeExtensions.advanced-alttab-window-switcher
    gnomeExtensions.media-controls
    gnomeExtensions.pano
    gnomeExtensions.shutdowntimer # https://extensions.gnome.org/extension/4372/shutdowntimer/
  ];
}
