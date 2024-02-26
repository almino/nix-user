{ lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  imports = [ ./apps/fish.nix ./typography.nix ];

  users.users.almino.packages = with pkgs; [
    gh
  ];
}
