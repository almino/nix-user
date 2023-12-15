{ lib, ... }:

{
  home.activation = {
    flatpak = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=/run/current-system/sw/share/X11/fonts
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=$HOME/.icons
    '';
  };
}
