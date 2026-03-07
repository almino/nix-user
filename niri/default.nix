{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
  ];

  programs.niri.enable = true;
  programs.waybar.enable = true; # top bar

  security.pam.services.swaylock = { };
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
}
