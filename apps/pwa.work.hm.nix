{ lib, pkgs, ... }:

{
  programs.firefoxpwa = {
    enable = lib.mkForce true;
    profiles = {
      "01KCM2XGT9DEE5QPP5BYN380MN" = {
        name = "UFC Sobral";
        # settings = lib.mkForce ../../options/firefox.nix;
        sites = {
          # GLPI
          "01KCM32JQ1B41SY3CVDJ098Q5J" = {
            desktopEntry = {
              enable = true;
              icon = pkgs.fetchurl {
                url = "https://glpi.sobral.ufc.br/icon-512x512.png";
                sha256 = "cd466d50a656f1b5e5113d1f2c7e55b55126c5ff1274bca249817bc3c86157ce";
              };
            };
            manifestUrl = "https://glpi.sobral.ufc.br/manifest.webmanifest";
            name = "GLPI";
            url = "https://glpi.sobral.ufc.br/";
          };
          # Polare UFC
          "01KCM7CT2Q9ASW8TJ0CEQX88YM" = {
            desktopEntry = {
              enable = true;
              icon = pkgs.fetchurl {
                url = "https://polare.ufc.br/polare/img/favicon-polare.svg";
                sha256 = "4527cfdc472cb6b8ccc9de6288ccf977fc37a70b094469b445344c455f43e0fa";
              };
            };
            manifestUrl = "file://" + (pkgs.writeText "polare.webmanifest" ''
              {
                "name": "Polare UFC",
                "short_name": "Polare",
                "start_url": "https://polare.ufc.br/",
                "display": "standalone",
                "background_color": "#eef2f4",
                "description": "Sistema Eletrônico do Programa de Gestão de Trabalho",
                "icons": [
                  {
                    "src": "https://polare.ufc.br/polare/img/favicon-polare.svg",
                    "sizes": "512x512",
                    "type": "image/svg+xml"
                  }
                ]
              }
            '');
            name = "Polare";
            url = "https://polare.ufc.br/";
          };
        };
      };
    };
  };
}
