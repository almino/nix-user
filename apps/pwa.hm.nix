{ lib, pkgs, ... }:

{
  programs.firefoxpwa = {
    enable = lib.mkDefault true;
    profiles = {
      "01KCMAMAN993BCZWC3PB24GJVX" = {
        name = "Pessoal";
        # settings = lib.mkForce ../../options/firefox.nix;
        sites = {
          # ChatGPT
          "01KCPW2P1PVRDZF94QJJ727FFP" =
            let
              name = "ChatGPT";
              url = "https://chatgpt.com/";
              icon = ./icons/chatgpt.png;
            in
            {
              desktopEntry = {
                enable = true;
                icon = icon;
              };
              manifestUrl = "file://" + (pkgs.writeText "chatgpt.webmanifest" ''
                {
                  "name": "${name}",
                  "short_name": "${name}",
                  "start_url": "${url}",
                  "display": "standalone",
                  "background_color": "#212121",
                  "description": "O ChatGPT é seu assistente de IA para uso diário. Converse com a IA mais avançada para explorar ideias, resolver problemas e aprender mais rápido.",
                  "icons": [
                    {
                      "src": "file://${icon}",
                      "sizes": "512x512",
                      "type": "image/png"
                    }
                  ]
                }
              '');
              name = name;
              url = url;
            };

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
                icon = ./icons/sheet.png;
              };
              manifestUrl = "file://" + (pkgs.writeText "cronograma-enfermagem.webmanifest" ''
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
                      "type": "image/png"
                    }
                  ]
                }
              '');
              name = name;
              url = url;
            };
          # Friendica
          "01KDGAXPFGQWGJPG1465DJASVV" =
            let
              name = "Friendica";
              url = "https://mini.log.br/";
              icon = ./icons/friendica.png;
            in
            {
              desktopEntry = {
                enable = true;
                icon = icon;
              };
              manifestUrl = "file://" + (pkgs.writeText "friendica.webmanifest" ''
                {
                  "name": "${name}",
                  "short_name": "${name}",
                  "start_url": "${url}",
                  "display": "standalone",
                  "background_color": "#89d69a",
                  "description": "O Friendica é sua rede social descentralizada para conectar com amigos e comunidades.",
                  "icons": [
                    {
                      "src": "file://${icon}",
                      "sizes": "512x512",
                      "type": "image/png"
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
              icon = ./icons/protonmail.svg.png;
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
            name = "Phanpy";
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
