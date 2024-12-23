{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    gnome-terminal
    gnome-tweaks
    gnomeExtensions.advanced-alttab-window-switcher
    gnomeExtensions.media-controls
    gnomeExtensions.nextcloud-folder
    gnomeExtensions.pano
    gnomeExtensions.shutdowntimer # https://extensions.gnome.org/extension/4372/shutdowntimer/
  ];
}
