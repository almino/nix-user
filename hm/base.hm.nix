{ config, lib, pkgs, ... }:

let
  vsCode = import ../fn/vscode.nix
    { inherit config lib pkgs; };
in

{
  imports = [
    ./flatpak.hm.nix
  ];

  programs.vscode = vsCode {
    # https://nix-community.github.io/home-manager/options.html#opt-programs.vscode.package
    # package = pkgs.unstable.vscode;
    package = pkgs.vscodium;
    settings = {
      "window.zoomLevel" = 1;
      "workbench.colorTheme" = "Solarized Light";
    };
  };
}
