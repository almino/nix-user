{ lib, pkgs, ... }:

let
  base = import ./base.nix { inherit lib pkgs; };
in
(base.profile // {
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    sponsorblock
  ] ++ base.extensions;
  settings = base.settings // {
    # "browser.newtabpage.pinned" = [{
    #   label = "Inter contas no Google Drive";
    #   url = "https://drive.google.com/drive/folders/0AL52I4sZa7qVUk9PVA";
    # }] ++ base.newtab;
    "services.sync.username" = "almino.melo@gmail.com";
  };
})
