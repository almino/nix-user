{ config, lib, pkgs, ... }:

let
  vsCode = import ./vscode.nix
    { inherit config lib pkgs; };
in

name:
extra:
extra // {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = name;
  home.homeDirectory = "/home/" + name;

  imports = [
    ../hm/flatpak.hm.nix
    ../hm/version.nix
    ../pkgs.config.nix
  ] ++ (extra.imports or [ ]);

  programs.firefox = {
    enable = lib.mkDefault true;
    # https://mozilla.github.io/policy-templates/#disablepocket
    policies.DisablePocket = lib.mkDefault true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.vscode = vsCode {
    # https://nix-community.github.io/home-manager/options.html#opt-programs.vscode.package
    # Necessário para não mostrar o erro de conflito
    package = lib.mkDefault pkgs.unstable.vscode;
  };
}
