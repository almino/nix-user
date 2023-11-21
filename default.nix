{ pkgs, ... }:

{
  environment.shellAliases = {
    ls = "exa -lh";
    now = "date +\"%Y-%m-%d--%H-%M-%S\"";
  };

  imports = [
    ./fish.nix
    ./nfs.nix
  ];

  users.users.almino = {
    description = "Almino Melo";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ exa fish gh ];
    shell = pkgs.fish;
  };
}
