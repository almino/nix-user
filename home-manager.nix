{ config, lib, pkgs, ... }:

let
  defaultHomeManager = import ./fn/home-manager.nix
    { inherit config lib pkgs; };
in
{
  imports = [ <home-manager/nixos> ];

  home-manager.users.almino = import ./hm/me.nix;
  # home-manager.users.visitante =
  #   { config, lib, pkgs, ... }:
  #   defaultHomeManager "visitante" { };
}
