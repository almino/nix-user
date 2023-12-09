{ lib, ... }:

{
  imports = [ ./base.nix ./home-manager.nix ];

  users.users.almino = {
    createHome = lib.mkDefault true;
    extraGroups = [ "networkmanager" "wheel" ];
    group = lib.mkDefault "users";
    home = lib.mkDefault "/home/almino";
    initialPassword = lib.mkDefault "123456";
    isNormalUser = lib.mkForce false;
    isSystemUser = lib.mkDefault true;
  };
}
