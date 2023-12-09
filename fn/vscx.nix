{ config, pkgs, ... }:

let
  baseP = import ../base/vscode/extensions.nix
    { inherit pkgs; };
in
let baseM = import ../base/vscode/marketplace.nix; in
let
  userPath =
    "/base/vscode/${config.home.username}";
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
