{ pkgs, ... }:

{
  imports = [ ./apps/gnome.default-applications.nix ];

  users.users.almino.packages = with pkgs; [
    citations # Manage your bibliographies using the BibTeX format
    collision # Check hashes for your files
    curtail # Simple & useful image compressor
    endeavour
    errands # Manage your tasks
    file-roller # GUI for tar zip rar
    gnome-decoder
    gnome-frog
    gnome-pomodoro
    gnome-solanum # pomodoro
    gnomeExtensions.bing-wallpaper-changer
    gnomeExtensions.browser-search-provider
    gnomeExtensions.firefox-profiles
    gnomeExtensions.one-thing
    gnomeExtensions.pop-shell
    junction # Choose the application to open files and links
    lorem # Generate placeholder text
    peazip
    switcheroo # App for converting images between different formats
    textpieces # Swiss knife of text processing
    tuba # Browse the Fediverse
  ];
}
