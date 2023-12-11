{ config, ... }:

name:
extra:
extra // {
  imports = [
    ../pkgs.config.nix
    ../hm/flatpak.hm.nix
    ../hm/version.nix
    # ../base/home-manager.nix
  ] ++ (extra.imports or []);

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = name;
  home.homeDirectory = "/home/" + name;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
