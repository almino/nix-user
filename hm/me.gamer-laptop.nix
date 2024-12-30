{ config, lib, pkgs, ... }:

let
  vsCode = import ../fn/vscode.nix
    { inherit config lib pkgs; };
in
{
  dconf.enable = true;

  imports = [
    ../../hm/proxy.dconf.hm.nix
    ./gnome-dconf.nix
    ./me.nix
  ];

  programs.vscode = lib.mkForce (vsCode {
    # https://nix-community.github.io/home-manager/options.html#opt-programs.vscode.package
    package = pkgs.unstable.vscode;
    settings = {
      "window.zoomLevel" = 1.25;
      # "workbench.colorTheme" = "Solarized Light";
    };
  });
}
