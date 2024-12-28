# https://github.com/tien-vo/system-config/blob/b7384294d71de373f015ac37c276bed98e7cf8b2/modules/user/information-management/zotero_beta/default.nix
# https://github.com/tien-vo/system-config/blob/b7384294d71de373f015ac37c276bed98e7cf8b2/modules/user/information-management/zotero_beta/userjs.nix
{ config, pkgs, ... }:
let
  inherit (config.xdg) dataHome;
in
# config.xdg.configFile."zotero/user.js".source

# https://github.com/lwndhrst/nixos-config/blob/59e94d70cb1e6f1e3bc1877b954086adac911995/modules/zotero/default.nix#L6
# home.packages = with pkgs; [
#     (zotero.overrideAttrs (p: rec {
#       # override zotero desktop file to use default light theme
#       desktopItem = p.desktopItem.override (d: {
#         exec = "env GTK_THEME=Default ${d.exec}";
#       });

#       # update install phase to use the new desktop file
#       installPhase = builtins.replaceStrings [ "${p.desktopItem}" ] [ "${desktopItem}" ] p.installPhase;
#     }))
#   ];
pkgs.writeTextFile ({
  name = "user.js";
  text = ''
    user_pref("extensions.zotero.dataDir", "${dataHome}/zotero");
    user_pref("extensions.zotero.export.quickCopy.setting", "export=ca65189f-8815-4afe-8c8b-8c7c15f0edca");
    user_pref("extensions.zotero.recursiveCollections", false);
    user_pref("extensions.zotero.automaticSnapshots", false);
    user_pref("extensions.zotero.automaticTags", false);
    user_pref("extensions.zotero.purge.tags", true);
    user_pref("extensions.zotero.sortCreatorAsString", true);
    user_pref("extensions.zotero.secondarySort.title", "year");
    user_pref("extensions.zotero.secondarySort.firstCreator", "year");

    user_pref("extensions.zotero.translators.better-bibtex.citekeyFold", false);
    user_pref("extensions.zotero.translators.better-bibtex.citekeyFormat", "auth.lower + (authini.len(\">\", 1) ? \"+\" : \"\") + year + infix(start=1)");
    user_pref("extensions.zotero.translators.better-bibtex.citekeyFormatEditing", "auth.lower + (authini.len(\">\", 1) ? \"+\" : \"\") + year + infix(start=1)");

    user_pref("extensions.zotmoov.dst_dir", "~/workspace/library/assets/zotero");
    user_pref("extensions.zotmoov.enable_subdir_move", true);
    user_pref("extensions.zotmoov.subdirectory_string", "{%a}");
  '';
})
