{ config, lib, pkgs, ... }:

let
  userPath =
    "/base/vscode/${config.home.username}.settings.nix";
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
  package ? pkgs.unstable.vscode,
  settings ? {},
}:
{
  enable = lib.mkDefault enable;
  enableUpdateCheck = lib.mkDefault enableUpdateCheck;
  extensions =
    if extensions == [] then
      (import ./vscx.nix { inherit config pkgs; } {})
    else extensions;
  keybindings = keybindings
    ++ (import ../base/vscode/keybindings.nix);
  package = lib.mkDefault package;
  userSettings =
    (import ../base/vscode/settings.nix { inherit lib; })
    // user // settings;
}
