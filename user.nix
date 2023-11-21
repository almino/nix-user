{ pkgs, ... }:

## Coisas que o Almino gosta de usar
{
  users.users.almino = {
    description = "Almino Melo";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    # Os aplicativos abaixo estão disponíveis
    # apenas para este usuário
    packages = with pkgs; [ gh ];
    shell = pkgs.fish;
  };
}
