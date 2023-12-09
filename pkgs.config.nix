{ pkgs, ... }:

{
  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;
  # https://nixos.wiki/wiki/Chromium#For_NixOS
  nixpkgs.config = {
    allowUnfree = true;

    # https://nixos.wiki/wiki/Cheatsheet#Upgrading_individual_packages_to_a_different_channel
    # Create an alias for the unstable channel
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };
}
