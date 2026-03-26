{ lib, pkgs, ... }:

let
  darkTheme = lib.mkDefault "Andromeda Bordered";
  lightTheme = lib.mkDefault "Gruvbox Light Medium";
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
  "explorer.fileNesting.enabled" = true;
  "explorer.fileNesting.expand" = false;
  "explorer.fileNesting.patterns" = (import ./file-nesting.nix) // {
    ".gitignore" = builtins.concatStringsSep ", " [
      ".git-blame*"
      ".gitattributes"
      ".gitmessage"
      ".gitmodules"
      ".lfsconfig"
      ".mailmap"
      ".stignore"
    ];
    "AGENTS.md" = builtins.concatStringsSep ", " [
      ".agents"
      ".opencode"
      "opencode.json*"
      "skills-lock.json"
    ];
    "docs" = builtins.concatStringsSep ", " [
      "CHANGELOG*"
      "openspec"
      "README*"
    ];
    "package.json" = builtins.concatStringsSep ", " [
      "node_modules"
      "*.code-workspace"
      ".browserslist*"
      ".circleci*"
      ".commitlint*"
      ".cspell*"
      ".cursor*"
      ".cz-config.js"
      ".czrc"
      ".dlint.json"
      ".dprint.json*"
      ".editorconfig"
      ".eslint*"
      ".firebase*"
      ".flowconfig"
      ".github*"
      ".gitlab*"
      ".gitmojirc.json"
      ".gitpod*"
      ".huskyrc*"
      ".jslint*"
      ".knip.*"
      ".lintstagedrc*"
      ".ls-lint.yml"
      ".markdownlint*"
      ".node-version"
      ".nodemon*"
      ".npm*"
      ".nvmrc"
      ".oxfmtrc.json"
      ".oxfmtrc.json.bak"
      ".oxfmtrc.jsonc"
      ".oxlintrc.json"
      ".oxlintrc.json.bak"
      ".oxlintrc.jsonc"
      ".pm2*"
      ".pnp.*"
      ".pnpm*"
      ".prettier*"
      ".pylintrc"
      ".release-please*.json"
      ".releaserc*"
      ".ruff.toml"
      ".sentry*"
      ".shellcheckrc"
      ".simple-git-hooks*"
      ".stackblitz*"
      ".styleci*"
      ".stylelint*"
      ".tazerc*"
      ".textlint*"
      ".tool-versions"
      ".travis*"
      ".versionrc*"
      ".vscode*"
      ".watchman*"
      ".windsurfrules"
      ".xo-config*"
      ".yamllint*"
      ".yarnrc*"
      "Procfile"
      "alejandra.toml"
      "apollo.config.*"
      "appveyor*"
      "azure-pipelines*"
      "biome.json*"
      "bower.json"
      "build.config.*"
      "bun.lock"
      "bun.lockb"
      "bunfig.toml"
      "colada.options.ts"
      "commitlint*"
      "crowdin*"
      "cspell*"
      "cz.config.*"
      "dangerfile*"
      "dlint.json"
      "dprint.json*"
      "ec.config.*"
      "electron-builder.*"
      "eslint*"
      "firebase.json"
      "grunt*"
      "gulp*"
      "jenkins*"
      "knip.*"
      "lefthook.*"
      "lerna*"
      "lint-staged*"
      "nest-cli.*"
      "netlify*"
      "nixpacks*"
      "nodemon*"
      "npm-shrinkwrap.json"
      "nx.*"
      "oxlint.config.*"
      "package-lock.json"
      "package.nls*.json"
      "phpcs.xml"
      "pm2.*"
      "pnpm*"
      "prettier*"
      "pullapprove*"
      "pyrightconfig.json"
      "release-please*.json"
      "release-tasks.sh"
      "release.config.*"
      "renovate*"
      "rolldown.config.*"
      "rollup.config.*"
      "rspack*"
      "ruff.toml"
      "sentry.*.config.ts"
      "simple-git-hooks*"
      "sonar-project.properties"
      "stylelint*"
      "taze.config.*"
      "tsdown.config.*"
      "tslint*"
      "tsup.config.*"
      "turbo*"
      "typedoc*"
      "unlighthouse*"
      "vercel*"
      "vetur.config.*"
      "webpack*"
      "workspace.json"
      "wrangler.*"
      "xo.config.*"
      "yarn*"
    ];
    "shell.nix" = builtins.concatStringsSep ", " [
      ".bin"
      ".envrc"
      ".tmuxp.yaml"
    ];
  };
  "files.associations".".tarignore" = "ignore";
  "files.exclude" = {
    "**/.direnv" = true;
    "**/.history" = true;
    "**/.stfolder" = true;
    "**/.stversions" = true;
    "**/.Trash-*" = true;
  };
  "files.trimTrailingWhitespace" = true;
  "js/ts.updateImportsOnFileMove.enabled" = "never";
  "git.autofetch" = false;
  "git.closeDiffOnOperation" = true;
  "git.openRepositoryInParentFolders" = "never";
  "git.showPushSuccessNotification" = true;
  "git.suggestSmartCommit" = false;
  "github.copilot.chat.localeOverride" = "pt-br";
  "github.copilot.nextEditSuggestions.enabled" = true;
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
  "shfmt.executablePath" = "${pkgs.shfmt}/bin/shfmt";
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
  "workbench.iconTheme" = lib.mkDefault "bearded-icons";
  # "workbench.iconTheme" = null;
  "workbench.preferredDarkColorTheme" = darkTheme;
  "workbench.preferredLightColorTheme" = lightTheme;
  "workbench.tree.indent" = 20;
}
