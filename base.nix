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
    ./apps/zoxide.nix
  ];

  programs.bat = {
    enable = true;
    # settings = {
    #   theme = "solarized";
    # };
  };

  programs.command-not-found.enable = true;

  programs.lazygit = {
    enable = true;
  };

  programs.nix-index = {
    enable = false;
    enableBashIntegration = true;
    enableFishIntegration = true;
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
