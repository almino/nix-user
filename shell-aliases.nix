{ lib, ... }:

{
  environment.shellAliases = {
    hms = lib.mkDefault "home-manager switch --no-out-link -b $(date +\"%Y%m%d-%H%M%S\")";
    ls = "eza -lh";
    now = lib.mkDefault "date +\"%Y-%m-%d--%H-%M-%S\"";
  };
}
