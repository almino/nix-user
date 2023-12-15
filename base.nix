{ pkgs, ... }:

{
  environment.shellAliases = {
    hms = "home-manager switch --no-out-link -b $(date +\"%Y%m%d-%H%M%S\")";
    now = "date +\"%Y-%m-%d--%H-%M-%S\"";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  imports = [ ./fish.nix ./typography.nix ];

  users.users.almino.packages = with pkgs; [
    gh
    gnome.gnome-terminal
    gnome.gnome-tweaks
    gnomeExtensions.advanced-alttab-window-switcher
    gnomeExtensions.media-controls
    gnomeExtensions.pano
    gnomeExtensions.shutdowntimer # https://extensions.gnome.org/extension/4372/shutdowntimer/
  ];
}
