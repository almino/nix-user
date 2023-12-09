{ lib, pkgs, ... }:

let
  base = import ./base.nix { inherit lib pkgs; };
in
(base.profile // {
  settings = base.settings // {
    "browser.newtabpage.pinned" = [
      {
        label = "Ponto";
        url = "https://si3.ufc.br/sigrh";
      }{
        label = "Solicitação de e-mail";
        url = "https://docs.google.com/spreadsheets/d/1B4ca2gFbNwA1Hcra5AqCg-HSrGQrUMWtgzWPkKoIPXQ";
      }
      {
        label = "Sites";
        url = "https://docs.google.com/spreadsheets/d/1AQx2oa5iq3Q8vXQnGdV22g-I7GVcuNsNQ6RHyj6ZPHg";
      }
    ] ++ base.newtab;
    "services.sync.username" = "almino@sobral.ufc.br";
  };
})
