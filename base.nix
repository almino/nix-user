{ lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  # home-manager.sharedModules = [{
  #   stylix.targets.xyz.enable = false;
  # }];

  imports = [
    ./apps/direnv.nix
    ./apps/fish.nix
    ./apps/tmux.nix
  ];

  users.users.almino = {
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ bat eza gh ];
    shell = lib.mkForce pkgs.fish;
  };
}
