{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    endeavour
    gnome-decoder
    gnome-frog
    gnome-pomodoro
    gnomeExtensions.one-thing
    gnomeExtensions.pop-shell
  ];
}
