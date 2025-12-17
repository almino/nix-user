{ lib, pkgs, ... }:

{
  programs.firefoxpwa = {
    enable = lib.mkDefault true;
    profiles = {
      "01KCMAMAN993BCZWC3PB24GJVX" = {
        name = "Pessoal";
        # settings = lib.mkForce ../../options/firefox.nix;
        sites = {
          # Cronograma Enfermagem
          "01KCMB3PWS3S0QKYX50A9KT4TH" =
            let
              name = "Cronograma Enfermagem";
              url = "https://docs.google.com/spreadsheets/d/1a42v1PUMNFM70pzBs--i0P2VLU87NXbKiWLeXjAvY0Q";
              icon = "https://ssl.gstatic.com/docs/spreadsheets/spreadsheets_2023q4.ico";
            in
            {
              desktopEntry = {
                enable = true;
                icon = pkgs.fetchurl {
                  url = icon;
                  sha256 = "203897dc099c4c1ff2d900f82c5384a0348ec31b83b256645d1a50931bb25961";
                };
              };
              manifestUrl = "file://" + (pkgs.writeText "polare.webmanifest" ''
                {
                  "name": "${name}",
                  "short_name": "Cronograma",
                  "start_url": "${url}",
                  "display": "standalone",
                  "background_color": "#eef2f4",
                  "description": "Meu cronograma de aulas do curso de Enfermagem da UVA",
                  "icons": [
                    {
                      "src": "${icon}",
                      "sizes": "512x512",
                      "type": "image/svg+xml"
                    }
                  ]
                }
              '');
              name = name;
              url = url;
            };
          # Proton Mail
          "01KCMAXVZXF9TFJWAN42B96G99" = {
            desktopEntry = {
              enable = true;
              icon = pkgs.fetchurl {
                url = "https://mail.proton.me/assets/android-chrome-maskable-512x512.png";
                sha256 = "d91d5d386ee9eca56cc8951e9a490ef5a210effe31b84eafd44f8dfd7713d0e8";
              };
            };
            manifestUrl = "https://mail.proton.me/assets/manifest.webmanifest";
            name = "Proton Mail";
            url = "https://mail.proton.me/";
          };
          # Phanpy Fediverso
          "01KCP3DMWYC0GE8A5CJ54EFGWB" = {
            desktopEntry = {
              enable = true;
              icon = pkgs.fetchurl {
                url = "https://phanpy.bolha.one/logo-512.png";
                sha256 = "8e6b20da63fc6fbf5bdb66b2a8da1c9a11f52b1ca4a89e228dffb758dda747f4";
              };
            };
            manifestUrl = "https://phanpy.bolha.one/manifest.webmanifest";
            name = "Phanpy Fediverso";
            url = "https://phanpy.bolha.one/";
          };
          # WhatsApp Web
          "01KCMAPGZ1K69GVPJ6VQR7144Q" = {
            desktopEntry = {
              enable = true;
              icon = pkgs.fetchurl {
                url = "https://static.whatsapp.net/rsrc.php/yp/r/iBj9rlryvZv.svg";
                sha256 = "4263557644394305484e870c67c1e57f6e8fe79f4e76b0893ba7b33e830a51e2";
              };
            };
            manifestUrl = "https://web.whatsapp.com/data/manifest.json";
            name = "WhatsApp Web";
            url = "https://web.whatsapp.com/";
          };
        };
      };
    };
  };
}
