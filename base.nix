{ lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
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

  programs.bat = {
    enable = true;
    settings.theme = "Solarized (dark)";
  };

  users.users.almino = {
    description = "Almino";
    extraGroups = [ "networkmanager" "wheel" ];
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ bat gh ];
    shell = lib.mkForce pkgs.fish;
  };
}
