{ pkgs, ... }:

{
  imports = [ ./apps/gnome.default-applications.nix ];

  users.users.almino.packages = with pkgs; [
    endeavour
    gnome-decoder
    gnome-frog
    gnome-pomodoro
    gnomeExtensions.browser-search-provider
    gnomeExtensions.firefox-profiles
    gnomeExtensions.one-thing
    gnomeExtensions.pop-shell
    gnomeExtensions.bing-wallpaper-changer
  ];
}
