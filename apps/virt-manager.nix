{ pkgs, ... }:

{
  networking.firewall.interfaces.virbr0.allowedTCPPorts = [ 3306 ];

  programs.virt-manager.enable = true;

  users.users.almino = {
    extraGroups = [ "libvirt" ];
    # <binary path="/etc/profiles/per-user/almino/bin/virtiofsd" xattr="on"/>
    packages = [ pkgs.virtiofsd ];
  };

  virtualisation.libvirtd.enable = true;
}
