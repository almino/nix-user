{ config, lib, pkgs, ... }:

let
  vsCode = import ../fn/vscode.nix
    { inherit config lib pkgs; };
in
{
  imports = [ ./me.nix ];

  programs.vscode = vsCode {
    # https://nix-community.github.io/home-manager/options.html#opt-programs.vscode.package
    # package = pkgs.unstable.vscode;
    settings = {
      "window.zoomLevel" = lib.mkDefault 1;
      "workbench.colorTheme" = "Solarized Light";
    };
  };
}
