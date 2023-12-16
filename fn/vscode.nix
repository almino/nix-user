{ config, lib, pkgs, ... }:

let
  userPath =
    "/apps/vscode/${config.home.username}.settings.nix";
in
let
  user = (if builtins.pathExists (../. + userPath) then
    import (../. + userPath)
  else { });
in

{
  enable ? true,
  enableUpdateCheck ? false,
  extensions ? [],
  keybindings ? [],
  # https://nix-community.github.io/home-manager/options.html#opt-programs.vscode.package
  package ? pkgs.vscodium,
  settings ? {},
}:
{
  enable = enable;
  enableUpdateCheck = enableUpdateCheck;
  extensions =
    if extensions == [] then
      (import ./vscx.nix { inherit config pkgs; } {})
    else extensions;
  keybindings = keybindings
    ++ (import ../apps/vscode/keybindings.nix);
  package = package;
  userSettings =
    (import ../apps/vscode/settings.nix { inherit lib; })
    // user // settings;
}
