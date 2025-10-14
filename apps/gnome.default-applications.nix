{ lib, ... }:

{
  xdg.mime = {
    enable = true;
    defaultApplications =
      let
        animatedImage = [
          "org.gnome.Loupe.desktop"
          "gimp.desktop"
        ];
        browsers = [
          # floorp.desktop
          # "net.waterfox.waterfox.desktop"
          "firefox.desktop"
          "google-chrome.desktop"
          "com.google.Chrome.desktop"
        ];
        codeOrBrowser = [ vsCode ] ++ browsers;
        pdf = [ "org.gnome.Evince.desktop" "draw.desktop" ];
        staticImage = [
          "org.gnome.Loupe.desktop"
          "com.belmoussaoui.Obfuscate.desktop"
          "io.gitlab.theevilskeleton.Upscaler.desktop"
          "gimp.desktop"
          "org.inkscape.Inkscape.desktop"
        ];
        viewEditImage = [
          "org.gnome.Loupe.desktop"
          "org.gnome.Evince.desktop"
          "gimp.desktop"
        ];
        text = [ "org.gnome.TextEditor.desktop" vsCode ];
        vsCode = "code.desktop";
      in
      ## Sources:
        # /run/current-system/sw/share/applications/mimeinfo.cache
        # ~/.nix-profile/share/applications/mimeinfo.cache
        # /etc/profiles/per-user/almino/share/applications/mimeinfo.cache
      {
        "application/pdf" = lib.mkDefault pdf;

        "x-scheme-handler/chrome" = lib.mkDefault "com.google.Chrome.desktop";
        "x-scheme-handler/mailto" = lib.mkDefault "org.gnome.Geary.desktop";
        "x-scheme-handler/tg" = lib.mkDefault "telegram.desktop";
        "x-scheme-handler/vscode" = lib.mkDefault "code-url-handler.desktop";
        "x-scheme-handler/xmpp" = lib.mkDefault "dino.desktop";
        "x-scheme-handler/zotero" = lib.mkDefault "zotero.desktop";

        "default-web-browser" = lib.mkDefault browsers;

        "application/vnd.mozilla.xul+xml" = lib.mkDefault browsers;
        "x-scheme-handler/about" = lib.mkDefault browsers;
        "x-scheme-handler/http" = lib.mkDefault browsers;
        "x-scheme-handler/https" = lib.mkDefault browsers;
        "x-scheme-handler/unknown" = lib.mkDefault browsers;

        "application/x-extension-htm" = lib.mkDefault codeOrBrowser;
        "application/x-extension-html" = lib.mkDefault codeOrBrowser;
        "application/x-extension-shtml" = lib.mkDefault codeOrBrowser;
        "application/x-extension-xht" = lib.mkDefault codeOrBrowser;
        "application/x-extension-xhtml" = lib.mkDefault codeOrBrowser;
        "application/xhtml+xml" = lib.mkDefault codeOrBrowser;
        "text/html" = lib.mkDefault codeOrBrowser;
        "text/xml" = lib.mkDefault codeOrBrowser;

        "application/xml" = lib.mkDefault text;
        "text/plain" = lib.mkDefault text;
        "text/x-c" = lib.mkDefault text;
        "text/x-diff" = lib.mkDefault text;
        "text/x-shellscript" = lib.mkDefault text;

        "image/avif" = lib.mkDefault animatedImage;
        "image/bmp" = lib.mkDefault staticImage;
        # "image/g3fax" = lib.mkDefault "gimp.desktop";
        "image/gif" = lib.mkDefault animatedImage;
        "image/heic" = lib.mkDefault animatedImage;
        # "image/heif" = lib.mkDefault "gimp.desktop";
        "image/jp2" = lib.mkDefault staticImage;
        "image/jpeg" = lib.mkDefault staticImage;
        "image/jxl" = lib.mkDefault animatedImage;
        "image/png" = lib.mkDefault staticImage;
        "image/svg+xml-compressed" = lib.mkDefault [
          "org.gnome.Loupe.desktop"
          "org.inkscape.Inkscape.desktop"
        ];
        "image/svg+xml" = lib.mkDefault staticImage;
        "image/tiff" = lib.mkDefault viewEditImage;
        # "image/vnd-ms.dds" = lib.mkDefault "org.gnome.Loupe.desktop";
        # "image/vnd.djvu" = lib.mkDefault "org.gnome.Evince.desktop";
        # "image/vnd.microsoft.icon" = lib.mkDefault "org.gnome.Loupe.desktop";
        # "image/vnd.radiance" = lib.mkDefault "org.gnome.Loupe.desktop";
        # "image/vnd.rn-realpix" = lib.mkDefault "vlc.desktop";
        "image/webp" = lib.mkDefault staticImage;
        # "image/x-bzeps" = lib.mkDefault "org.gnome.Evince.desktop";
        # "image/x-compressed-xcf" = lib.mkDefault "gimp.desktop";
        # "image/x-dds" = lib.mkDefault "org.gnome.Loupe.desktop";
        # "image/x-emf" = lib.mkDefault "draw.desktop;org.inkscape.Inkscape.desktop";
        # "image/x-eps" = lib.mkDefault "org.gnome.Evince.desktop;org.inkscape.Inkscape.desktop";
        "image/x-exr" = lib.mkDefault animatedImage;
        # "image/x-fits" = lib.mkDefault "gimp.desktop";
        # "image/x-freehand" = lib.mkDefault "draw.desktop";
        # "image/x-gimp-gbr" = lib.mkDefault "gimp.desktop";
        # "image/x-gimp-gih" = lib.mkDefault "gimp.desktop";
        # "image/x-gimp-pat" = lib.mkDefault "gimp.desktop";
        # "image/x-gzeps" = lib.mkDefault "org.gnome.Evince.desktop";
        "image/x-icon" = lib.mkDefault staticImage;
        # "image/x-pcx" = lib.mkDefault "gimp.desktop";
        # "image/x-portable-anymap" = lib.mkDefault animatedImage;
        "image/x-portable-bitmap" = lib.mkDefault staticImage;
        # "image/x-portable-graymap" = lib.mkDefault animatedImage;
        # "image/x-portable-pixmap" = lib.mkDefault animatedImage;
        # "image/x-psd" = lib.mkDefault "gimp.desktop";
        # "image/x-psp" = lib.mkDefault "gimp.desktop";
        # "image/x-qoi" = lib.mkDefault "org.gnome.Loupe.desktop";
        # "image/x-sgi" = lib.mkDefault "gimp.desktop";
        # "image/x-sun-raster" = lib.mkDefault "gimp.desktop";
        # "image/x-tga" = lib.mkDefault animatedImage;
        # "image/x-vsd" = lib.mkDefault "org.inkscape.Inkscape.desktop";
        "image/x-webp" = lib.mkDefault staticImage;
        # "image/x-wmf" = lib.mkDefault "draw.desktop;gimp.desktop;org.inkscape.Inkscape.desktop";
        "image/x-xbitmap" = lib.mkDefault staticImage;
        # "image/x-xcdr" = lib.mkDefault "org.inkscape.Inkscape.desktop";
        # "image/x-xcf" = lib.mkDefault "gimp.desktop";
        # "image/x-xcursor" = lib.mkDefault "gimp.desktop";
        # "image/x-xpixmap" = lib.mkDefault "gimp.desktop";
        # "image/x-xwindowdump" = lib.mkDefault "gimp.desktop";

        "application/vnd.ms-word.document.macroenabled.12" = lib.mkDefault "writer.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = lib.mkDefault "writer.desktop";

        # "application/com.github.phase1geo.minder" = lib.mkDefault "com.github.phase1geo.minder.desktop";
        # "application/epub+zip" = lib.mkDefault "sigil.desktop";
        # "application/geopackage+sqlite3" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/sqlitebrowser" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/vnd.db4s-project+xml" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/vnd.jgraph.mxfile" = lib.mkDefault "drawio.desktop";
        # "application/vnd.nextcloud" = lib.mkDefault "com.nextcloud.desktopclient.nextcloud.desktop";
        # "application/vnd.sqlite3" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/vnd.visio" = lib.mkDefault "drawio.desktop";
        # "application/x-sqlite2" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/x-sqlite3" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/x-sqlitebrowser" = lib.mkDefault "sqlitebrowser.desktop";
        # "application/x-vnc" = lib.mkDefault "org.gnome.Connections.desktop";
        "text/csv" = lib.mkDefault [ "calc.desktop" "sqlitebrowser.desktop" ];
        # "x-scheme-handler/feishin" = lib.mkDefault "feishin.desktop";
        # "x-scheme-handler/nc" = lib.mkDefault "com.nextcloud.desktopclient.nextcloud.desktop";
        # "x-scheme-handler/obsidian" = lib.mkDefault "obsidian.desktop";
        # "x-scheme-handler/rlogin" = lib.mkDefault "ktelnetservice6.desktop";
        # "x-scheme-handler/ssh" = lib.mkDefault "ktelnetservice6.desktop";
        # "x-scheme-handler/telnet" = lib.mkDefault "ktelnetservice6.desktop";
      };
  };
}
