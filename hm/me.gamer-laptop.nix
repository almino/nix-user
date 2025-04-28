{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

let
  vsCode = import ../fn/vscode.nix
    { inherit config lib pkgs; };
in
{
  dconf.enable = true;

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = lib.mkForce true;
      night-light-schedule-automatic = lib.mkForce false;
      night-light-schedule-from = lib.mkForce 17.0;
      night-light-schedule-to = lib.mkForce 6.0;
      night-light-temperature = lib.mkForce (mkUint32 2848);
    };

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
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Terminal.desktop"
        "code.desktop"
        "feishin.desktop"
        "obsidian.desktop"
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
          "Zotero":["Read"]
        }
      '';
    };
  };

  home.file.obsidian = {
    source = "${pkgs.obsidian}/share/applications/obsidian.desktop";
    target = ".config/autostart/obsidian.desktop";
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

  # systemd.user.services.mpris-proxy = {
  #   Install = { WantedBy = [ "default.target" ]; };
  #   Service = {
  #     ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  #   };
  #   Unit = {
  #     After = [ "network.target" "sound.target" ];
  #     Description = "Mpris proxy";
  #   };
  # };
}
