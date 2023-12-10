# nix-prefetch-url "https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/aaron-bond/extension/better-comments/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
{ pkgs, ... }:

with pkgs.vscode-extensions; [
  skyapps.fish-vscode
]