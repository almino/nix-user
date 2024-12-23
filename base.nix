{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat
    nil
    nixpkgs-fmt
  ];

  # home-manager.sharedModules = [{
  #   stylix.targets.xyz.enable = false;
  # }];

  imports = [
    ./apps/fish.nix
    ./apps/tmux.nix
    ./typography.nix
  ];

  users.users.almino.packages = with pkgs; [
    gh
    nextcloud-client
  ];
}
