{ pkgs, ... }:

with pkgs.vscode-extensions; [
  # bbenoist.nix
  eamodio.gitlens
  esbenp.prettier-vscode
  jnoortheen.nix-ide
  mikestead.dotenv
  piousdeer.adwaita-theme
  redhat.vscode-yaml
  yzhang.markdown-all-in-one
]
