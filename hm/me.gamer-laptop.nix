{ config, lib, pkgs, ... }:

let
  vsCode = import ../fn/vscode.nix
    { inherit config lib pkgs; };
in
{
  dconf.enable = true;

  dconf.settings = {
    "org/gnome/shell" = {
      disabled-extensions = lib.mkDefault (with pkgs;  [
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "window-list@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        gnomeExtensions.weather-oclock.extensionUuid
      ]);
      enabled-extensions = with pkgs; [
        gnomeExtensions.advanced-alttab-window-switcher.extensionUuid
        gnomeExtensions.expandable-notifications.extensionUuid
        gnomeExtensions.nextcloud-folder.extensionUuid
        gnomeExtensions.pano.extensionUuid
        gnomeExtensions.pop-shell.extensionUuid
        gnomeExtensions.space-bar.extensionUuid
        gnomeExtensions.vitals.extensionUuid
        gnomeExtensions.wiggle.extensionUuid
        gnomeExtensions.wifi-qrcode.extensionUuid
        gnomeExtensions.vscode-search-provider.extensionUuid
        gnomeExtensions.tailscale-qs.extensionUuid
      ];
      favorite-apps = lib.mkDefault [
        "firefox.desktop"
        "org.gnome.Terminal.desktop"
        "code.desktop"
        "zotero.desktop"
      ];
    };

    "org/gnome/shell/extensions/space-bar/state" = {
      workspace-names-map = lib.mkDefault ''
        {
          "code-url-handler":["Code"],
          "Code":["Code"],
          "gnome-control-center":["Config"],
          "google-chrome":["Read"],
          "org.gnome.Calendar":["Plan"],
          "org.gnome.Console":["Config"],
          "org.gnome.Settings":["Config"],
          "org.gnome.Terminal":["Config"],
          "org.gnome.Todo":["Plan"],
          "librewolf":["Listen"],
          "Zotero":["Read"]}
      '';
    };
  };

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