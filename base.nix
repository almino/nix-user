{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

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
