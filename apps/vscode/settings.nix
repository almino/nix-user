{ lib, pkgs, ... }:

let
  darkTheme = lib.mkDefault "Cobalt2 Theme Tweaked";
  lightTheme = lib.mkDefault "Solarized Light";
in
{
  "[angular]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[css]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[ember]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[flow]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[glimmer]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[graphql]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[handlebars]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[html]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "editor.tabSize" = 4;
  };
  "[javascript]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[json]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[jsonc]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[jsx]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[less]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[markdown]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[nix]"."editor.defaultFormatter" =
    "B4dM4n.nixpkgs-fmt";
  "[scss]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[typescript]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[vue]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "[yaml]"."editor.defaultFormatter" =
    "esbenp.prettier-vscode";
  "diffEditor.ignoreTrimWhitespace" = false;
  "editor.fontFamily" = lib.mkDefault
    (builtins.concatStringsSep ", " [
      "'CaskaydiaCove Nerd Font'"
      "'Cascadia Code'"
      "'Hasklug Nerd Font'"
      "Hasklig"
      "'FiraCode Nerd Font'"
      "'Fira Code'"
      "'Droid Sans Mono'"
      "'monospace'"
      "monospace"
    ]);
  "editor.fontLigatures" = true;
  "editor.fontSize" = lib.mkDefault 14;
  # "editor.renderLineHighlight" = "none";
  "editor.rulers" = [ 50 ];
  "editor.stickyScroll.enabled" = true;
  "editor.tabCompletion" = "on";
  "editor.tabSize" = lib.mkDefault 2;
  "files.associations".".tarignore" = "ignore";
  "files.exclude" = {
    "**/.direnv" = true;
    "**/.history" = true;
    "**/.Trash-*" = true;
  };
  "files.trimTrailingWhitespace" = true;
  "git.autofetch" = false;
  "git.closeDiffOnOperation" = true;
  "git.openRepositoryInParentFolders" = "never";
  "git.showPushSuccessNotification" = true;
  "git.suggestSmartCommit" = false;
  "gitlens.advanced.messages"
  ."suppressCreatePullRequestPrompt" = true;
  "gitlens.defaultDateFormat" =
    "DD de MMMM de YYYY, H:m";
  "gitlens.defaultDateLocale" = "pt-BR";
  "gitlens.defaultDateShortFormat" = "DD/MM/YYYY";
  "gitlens.defaultTimeFormat" = "HH:mm";
  "gitlens.launchpad.indicator.enabled" = false;
  "nix.enableLanguageServer" = true; # Enable LSP.
  "nix.serverPath" = "nil"; # The path to the LSP server executable.
  "nix.serverSettings".nil.formatting.command =
    [ "nixpkgs-fmt" ];
  "prettier.printWidth" = 50;
  "redhat.telemetry.enabled" = true;
  "remote.SSH.useLocalServer" = false;
  "security.promptForLocalFileProtocolHandling" = false;
  "sql-formatter.uppercase" = true;
  "terminal.integrated.fontFamily" = lib.mkDefault
    (builtins.concatStringsSep ", " [
      "'FiraCode Nerd Font'"
      "'Fira Code'"
      "'Hasklug Nerd Font'"
      "Hasklig"
      "'CaskaydiaCove Nerd Font'"
      "'Cascadia Code'"
      "'Droid Sans Mono'"
      "'monospace'"
      "monospace"
    ]);
  "terminal.integrated.fontSize" = lib.mkDefault 12;
  "vscode-auto-light-dark-theme.darkTheme" = darkTheme;
  "vscode-auto-light-dark-theme.lightTheme" = lightTheme;
  "vscode-auto-light-dark-theme.toggleSetting" = lib.mkDefault "system";
  "window.autoDetectColorScheme" = true;
  "window.commandCenter" = true;
  "window.titleBarStyle" = "custom";
  "window.zoomLevel" = lib.mkDefault 1.5;
  "workbench.colorTheme" = lightTheme;
  # "workbench.colorTheme" = lib.mkDefault "Palenight (Mild Contrast)";
  # "workbench.colorTheme" = lib.mkDefault "Quiet Light";
  "workbench.iconTheme" = lib.mkDefault "material-icon-theme";
  # "workbench.iconTheme" = null;
  "workbench.preferredDarkColorTheme" = darkTheme;
  # "workbench.preferredLightColorTheme" = "Adwaita Light";
  "workbench.tree.indent" = 12;
}
