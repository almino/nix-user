# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
# nix-shell -p pkgs.dconf2nix --run "dconf dump / | dconf2nix > gnome-dconf.nix"
{ lib, pkgs, ... }:

with lib.hm.gvariant;

{
  dconf.settings = with lib; {
    "org/gnome/Characters" = {
      recent-characters = [ "×" "–" "—" "…" "☭" ];
    };

    "org/gnome/desktop/a11y/magnifier" = {
      lens-mode = true;
      mag-factor = 2.0;
    };

    # "org/gnome/desktop/app-folders" = {
    #   folder-children = [ "Utilities" "YaST" ];
    # };

    # "org/gnome/desktop/app-folders/folders/Utilities" = {
    #   apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
    #   categories = [ "X-GNOME-Utilities" ];
    #   name = "X-GNOME-Utilities.directory";
    #   translate = true;
    # };

    # "org/gnome/desktop/app-folders/folders/YaST" = {
    #   categories = [ "X-SuSE-YaST" ];
    #   name = "suse-yast.directory";
    #   translate = true;
    # };

    # nix-shell -p pkgs.dconf2nix --run "dconf dump /org/gnome/desktop/interface/ | dconf2nix > work-dconf.interface.nix"
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "Roboto Slab 11";
      font-antialiasing = "rgba"; # "none"; "grayscale"; "rgba";
      font-hinting = "full"; # "none"; "slight"; "medium"; "full";
      font-name = "Fira Sans Semi-Light 12";
      monospace-font-name = "FiraMono Nerd Font 11";
      # text-scaling-factor = 1.2;
      toolkit-accessibility = false;
    };

    # "org/gnome/desktop/notifications" = {
    #   application-children = [ "code" ];
    # };

    # "org/gnome/desktop/notifications/application/code" = {
    #   application-id = "code.desktop";
    # };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/session" = lib.mkDefault {
      idle-delay = mkUint32 60; # segundos
    };

    # nix-shell -p pkgs.dconf2nix --run "dconf dump /org/gnome/desktop/wm/preferences/ | dconf2nix > work-dconf.preferences.nix"
    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Fira Sans Semi-Bold 10";
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "processes";
      maximized = false;
    };

    # "org/gnome/evolution-data-server" = {
    #   migrated = true;
    # };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view"; # "icon-view";
      # migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      search-view = "list-view"; # "icon-view";
    };

    # "org/gnome/nautilus/window-state" = {
    #   initial-size = mkTuple [ 800 550 ];
    #   maximized = true;
    # };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = lib.mkDefault false;
      night-light-schedule-automatic = lib.mkDefault true;
      night-light-schedule-from = lib.mkDefault 17.0;
      night-light-schedule-to = lib.mkDefault 6.0;
      night-light-temperature = lib.mkDefault (mkUint32 2848);
    };

    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [ ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = lib.mkDefault [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = lib.mkDefault "<Super>e";
      command = lib.mkDefault "nautilus recent:///";
      name = lib.mkDefault "Arquivos recentes";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = lib.mkDefault "<Ctrl><Alt>t";
      command = lib.mkDefault "gnome-terminal";
      name = lib.mkDefault "Console";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = lib.mkDefault "<Super>t";
      command = lib.mkDefault "gnome-terminal";
      name = lib.mkDefault "Pop Console";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = lib.mkDefault "hibernate";
      sleep-inactive-ac-timeout = lib.mkDefault 600; #seconds
      sleep-inactive-ac-type = lib.mkDefault "nothing";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
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
        # "expandable-notifications@kaan.g.inam.org"
        # "pano@elhan.io"
        # "space-bar@luchrioh"
        # "Vitals@CoreCoding.com"
        # gnomeExtensions.expandable-notifications.extensionUuid
        # gnomeExtensions.nextcloud-folder.extensionUuid
        gnomeExtensions.bing-wallpaper-changer.extensionUuid
        gnomeExtensions.browser-search-provider.extensionUuid
        gnomeExtensions.firefox-profiles.extensionUuid
        gnomeExtensions.pano.extensionUuid
        gnomeExtensions.vitals.extensionUuid
        gnomeExtensions.vscode-search-provider.extensionUuid
        gnomeExtensions.wifi-qrcode.extensionUuid
        gnomeExtensions.wiggle.extensionUuid
      ];
      favorite-apps = lib.mkDefault [
        "firefox.desktop"
        "org.gnome.Terminal.desktop"
        "code.desktop"
      ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = lib.mkDefault {
      app-switcher-popup-hide-win-counter-for-single-window = true;
      app-switcher-popup-icon-size = 96;
      app-switcher-popup-titles = false;
      enable-super = false;
      hot-edge-mode = 0;
      hot-edge-monitor = 1;
      super-double-press-action = 3;
      super-key-mode = 1;
      switcher-popup-hover-select = false;
      switcher-popup-interactive-indicators = false;
      switcher-popup-monitor = 3;
      switcher-popup-position = 2;
      switcher-popup-preview-selected = 2;
      switcher-popup-show-if-no-win = false;
      switcher-popup-theme = 0;
      switcher-ws-thumbnails = 1;
      win-switch-include-modals = true;
      win-switcher-popup-filter = 1;
      win-switcher-popup-icon-size = 64;
      win-switcher-popup-order = 1;
      win-switcher-popup-sorting = 1;
    };

    # "org/gnome/shell/extensions/auto-move-windows" = lib.mkDefault {
    #   "chromium-browser.desktop" = 3;
    #   "google-chrome.desktop" = 3;
    #   "org.gnome.Calendar.desktop" = 2;
    #   "org.gnome.Todo.desktop" = 2;
    #   "org.telegram.desktop.desktop" = 1;
    #   "spotify.desktop" = 1;
    # };

    "org/gnome/shell/extensions/one-thing" = {
      index-in-status-bar = 2;
      location-in-status-bar = 0;
      show-settings-button-on-popup = false;
    };

    "org/gnome/shell/extensions/pano" = lib.mkDefault {
      global-shortcut = [ "<Super>v" ];
      keep-search-entry = false;
      open-links-in-browser = false;
      send-notification-on-copy = false;
    };

    /* "org/gnome/shell/extensions/space-bar/behavior" = lib.mkDefault {
      position = "right";
      show-empty-workspaces = false;
      smart-workspace-names = true;
    }; */

    # "org/gnome/shell/extensions/space-bar/state" = {
    #   workspace-names-map = lib.mkDefault ''
    #     {
    #       "code-url-handler": ["Code"],
    #       "Code": ["Code"],
    #       "gnome-control-center": ["Config"],
    #       "google-chrome": ["Code"],
    #       "Microsoft-edge": ["Code"],
    #       "org.gnome.Calendar": ["Demanda"],
    #       "org.gnome.Console": ["Code"],
    #       "org.gnome.Settings": ["Config"],
    #       "org.gnome.Terminal": ["Code"],
    #       "org.gnome.Todo": ["Demanda"],
    #       "Spotify": ["Chat"]
    #     }
    #   '';
    # };

    "org/gnome/shell/extensions/vitals" = lib.mkDefault {
      position-in-panel = 0;
      show-battery = false;
      show-fan = false;
      show-processor = false;
      show-storage = false;
      show-system = false;
      show-voltage = false;
    };

    "org/gnome/shell/weather" =
      {
        automatic-location = true;
        locations = [ "<(uint32 2, <('Sobral', 'JSO', true, [(-3.67477, -40.31073)], [(-3.70202, -40.35630)])>)>" ];
      };

    # "org/gnome/shell/world-clocks" = {
    #   locations = "@av []";
    # };

    # "org/gnome/software" = {
    #   check-timestamp = mkInt64 1691940367;
    #   first-run = false;
    # };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      # sidebar-width = 148;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      # window-position = mkTuple [ 0 32 ];
      # window-size = mkTuple [ 800 521 ];
    };
  };
}
