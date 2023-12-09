{ config, ... }:

name:
extra:
extra // {
  imports = [
    ./flatpak.nix
  ] ++ extra.imports;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # home.username = name;
  # home.homeDirectory = "/home/" + name;


  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;
  # https://nixos.wiki/wiki/Chromium#For_NixOS
  nixpkgs.config = {
    allowUnfree = true;

    # https://nixos.wiki/wiki/Cheatsheet#Upgrading_individual_packages_to_a_different_channel
    # Create an alias for the unstable channel
    packageOverrides = pkgs: {
      nur = import
        (builtins.fetchTarball
          "https://github.com/nix-community/NUR/archive/master.tar.gz")
        { inherit pkgs; };
      unstable = import <nixos-unstable> {
        # pass the nixpkgs config to the unstable alias # to ensure `allowUnfree = true;` is propagated:
        config = config.nixpkgs.config;
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
}
