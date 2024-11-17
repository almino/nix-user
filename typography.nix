{ pkgs, ... }:

{
  # !! NÃO altere as linhas ACIMA !!

  # https://nixos.wiki/wiki/Fonts#Installing_fonts_on_NixOS
  # fonts.packages = with pkgs; [
  #   nerdfonts
  # ];

  # https://nixos.wiki/wiki/Fonts#:~:text=fonts%5B2%5D-,Flatpak%20applications%20can%27t%20find%20system%20fonts,-Enable%20fontDir%20in
  fonts.fontDir.enable = true;

  # !! NÃO altere as linhas ABAIXO !!
}
