{ lib, ... }:

{
  environment.shellAliases = {
    # ls = "eza -lAgh";
    now = lib.mkDefault "date +\"%Y-%m-%d--%H-%M-%S\"";
  };
}
