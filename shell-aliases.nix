{ lib, ... }:

{
  environment.shellAliases = {
    ls = "eza -lh";
    now = lib.mkDefault "date +\"%Y-%m-%d--%H-%M-%S\"";
  };
}
