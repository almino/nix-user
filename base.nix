{ config, pkgs, ... }:

{
  environment.shellAliases = {
    now = "date +\"%Y-%m-%d--%H-%M-%S\"";
  };

  imports = [ ./fish.nix ];
}
