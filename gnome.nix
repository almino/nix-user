{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    endeavour
    gnome-pomodoro
    gnomeExtensions.one-thing
    gnomeExtensions.pop-shell
  ];
}
