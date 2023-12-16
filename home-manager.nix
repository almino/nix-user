{ config, lib, pkgs, ... }:

let
  defaultHomeManager = import ./fn/home-manager.nix
    { inherit config lib pkgs; };
in
{
  imports = [ <home-manager/nixos> ];

  home-manager.users = {
    almino = lib.mkDefault (import ./hm/me.nix);

    # visitante =
    #   { config, lib, pkgs, ... }:
    #   defaultHomeManager "visitante" { };
  };
}
