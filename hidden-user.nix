{ lib, ... }:

{
  imports = [ ./default.nix ];

  services.xserver.displayManager.gdm.settings = {
    greeter = {
      Exclude = builtins.concatStringsSep "," [
        "almino"
        "dti"
      ];
      IncludeAll = lib.mkDefault false;
    };
  };

  users.users.almino = {
    createHome = lib.mkDefault true;
    extraGroups = [ "networkmanager" "wheel" ];
    group = lib.mkDefault "users";
    home = lib.mkDefault "/home/almino";
    initialHashedPassword = lib.mkDefault "$y$j9T$MrT2zn6oMcG8Kbs70WU9j.$n7.bPF1mbf8GKzxCFG8c6KvJLMviuOynzM6/DjnHn62";
    isNormalUser = false;
    isSystemUser = lib.mkDefault true;
  };
}
