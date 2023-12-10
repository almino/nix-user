{ config, pkgs, ... }:

let
  baseP = import ../apps/vscode/extensions.nix
    { inherit pkgs; };
in
let baseM = import ../apps/vscode/marketplace.nix; in
let
  userPath =
    "/apps/vscode/${config.home.username}";
in
let
  user = (if builtins.pathExists (../. + "${userPath}.nix") then
    import (../. + "${userPath}.nix")
  else [ ]);
in
let
  userP = (if builtins.pathExists (../. + "${userPath}.pkgs.nix") then
    import (../. + "${userPath}.pkgs.nix") { inherit pkgs; }
  else [ ]);
in

{
  nix ? [],
  pkg ? [],
  packaged ? [],
  marketplace ? [],
}:
(
  (pkgs.vscode-utils.extensionsFromVscodeMarketplace (
    baseM
    ++ user
    ++ marketplace
  ))
  ++ baseP
  ++ userP
  ++ nix
  ++ pkg
  ++ packaged
)
