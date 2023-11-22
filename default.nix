{ lib, pkgs, ... }:

{
  environment.shellAliases = {
    ls = "exa -lh";
    now = "date +\"%Y-%m-%d--%H-%M-%S\"";
  };

  imports = [ ./fish.nix ./nfs.nix ];

  users.users.almino = {
    description = "Almino Melo";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = lib.mkDefault true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ exa gh ];
    shell = lib.mkDefault pkgs.fish;
    useDefaultShell = lib.mkDefault false;
  };
}
