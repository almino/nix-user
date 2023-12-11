{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  home-manager.users.almino = import ./hm/me.nix { inherit config lib pkgs; };
}
