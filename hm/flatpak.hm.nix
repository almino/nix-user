{ lib, pkgs, ... }:

{
  home.activation = {
    flatpak = lib.hm.dag.entryAfter ["writeBoundary"] ''
      # ln -s /run/current-system/sw/share/X11/fonts "$(xdg-user-dir HOME)/.local/share/fonts"
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=/run/current-system/sw/share/X11/fonts
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=$HOME/.icons
    '';
  };
}
