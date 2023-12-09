{ lib, pkgs, ... }:

let
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    bypass-paywalls-clean
    consent-o-matic #GDPR
    copy-selection-as-markdown
    ghosttext # https://github.com/fregante/GhostText
    github-file-icons
    octolinker
    omnisearch # https://github.com/alyssaxuu/omni
    pushbullet
    ublock-origin
  ];
  newtab = [
    {
      label = "Inter contas no Google Drive";
      url = "https://drive.google.com/drive/folders/0AL52I4sZa7qVUk9PVA";
    }
    {
      label = "WhatsApp Web";
      url = "https://web.whatsapp.com";
    }
  ];
  # Copiar de https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js
  settings = {
    # ~/.mozilla/firefox/personal/prefs.js
    "browser.bookmarks.showMobileBookmarks" = true;
    "browser.search.isUS" = false;
    "browser.search.region" = "BR";
    "browser.shell.checkDefaultBrowser" = false;
    "browser.translations.neverTranslateLanguages" = "pt,en";
    "devtools.cache.disabled" = true;
    "distribution.searchplugins.defaultLocale" = "pt-BR";
    # "font.minimum-size.x-western" = 14;
    "font.name.monospace.x-western" = "FiraMono Nerd Font";
    "font.name.sans-serif.x-western" = "Fira Sans";
    "font.name.serif.x-western" = "Roboto Slab";
    # "font.size.monospace.x-western" = 18;
    "font.size.variable.x-western" = 14;
    "general.useragent.locale" = "pt-BR";
    "intl.locale.requested" = "pt-BR,en-US,en-GB";
    "browser.newtabpage.pinned" = newtab;
  };
in
{
  # https://github.com/nix-community/NUR
  extensions = extensions;
  newtab = newtab;
  profile = {
    extensions = extensions;
    id = lib.mkDefault 0;
    isDefault = lib.mkDefault true;
    search.engines = {

      "Home Manager Options" = {
        urls = [{
          template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
        }];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@hm" ];
      };

      "Nix Packages" = {
        urls = [{
          template = "https://search.nixos.org/packages";
          params = [
            { name = "type"; value = "packages"; }
            { name = "query"; value = "{searchTerms}"; }
          ];
        }];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@nixos" ];
      };

      "Nix Options" = {
        urls = [{
          template = "https://search.nixos.org/options";
          params = [
            { name = "type"; value = "options"; }
            { name = "query"; value = "{searchTerms}"; }
          ];
        }];

        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@nix" ];
      };

      "NixOS Wiki" = {
        urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
        iconUpdateURL = "https://nixos.wiki/favicon.png";
        updateInterval = 24 * 60 * 60 * 1000; # every day
        definedAliases = [ "@nw" ];
      };

    };
    settings = settings;
  };
  settings = settings;
}

