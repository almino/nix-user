{ lib, ... }:

let rootPath = "/export"; in
{
  fileSystems."${rootPath}/nix-config" = {
    device = "/nix-config";
    options = [ "bind" ];
  };

  networking.firewall.allowedTCPPorts = [ 2049 ];

  services.nfs.server.enable = lib.mkDefault true;
  services.nfs.server.exports = lib.mkDefault ''
    ${rootPath}             200.129.37.7(rw,fsid=0,no_subtree_check) 200.129.37.8(rw,fsid=0,no_subtree_check)
    ${rootPath}/nix-config  200.129.37.7(rw,nohide,insecure,no_subtree_check) 200.129.37.8(rw,nohide,insecure,no_subtree_check)
  '';

  system.activationScripts.nfs =
    builtins.concatStringsSep " && " [
      "mkdir --mode=775 --parents ${rootPath}"
      "chown nobody:nogroup ${rootPath}"
    ];
}
