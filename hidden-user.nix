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
}
