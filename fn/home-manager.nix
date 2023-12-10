{ config, ... }:

name:
extra:
extra // {
  imports = [
    ../pkgs.config.nix
    ./flatpak.hm.nix
    ../hm/version.nix
    # ../base/home-manager.nix
  ] ++ extra.imports;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = name;
  home.homeDirectory = "/home/" + name;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
