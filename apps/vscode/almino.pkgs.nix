# nix-prefetch-url "https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/aaron-bond/extension/better-comments/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
{ pkgs, ... }:

with pkgs.vscode-extensions; [
  alefragnani.project-manager
  arrterian.nix-env-selector
  batisteo.vscode-django
  bmewburn.vscode-intelephense-client
  bradlc.vscode-tailwindcss
  christian-kohler.npm-intellisense
  devsense.composer-php-vscode
  devsense.phptools-vscode
  firefox-devtools.vscode-firefox-debug
  github.copilot
  github.copilot-chat
  kamikillerto.vscode-colorize
  ms-python.black-formatter
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  rust-lang.rust-analyzer
  stephlin.vscode-tmux-keybinding
  tailscale.vscode-tailscale
  tamasfe.even-better-toml
  tauri-apps.tauri-vscode
  usernamehw.errorlens
  vue.volar
  xdebug.php-debug
]