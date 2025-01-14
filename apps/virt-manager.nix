{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
    # virtiofsd
  ];

  networking.firewall.interfaces.virbr0.allowedTCPPorts = [ 3306 ];

  programs.virt-manager.enable = true;

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];

  users.users.almino = {
    extraGroups = [ "libvirt" ];
    # <binary path="/etc/profiles/per-user/almino/bin/virtiofsd" xattr="on"/>
    packages = [ pkgs.virtiofsd ];
  };

  virtualisation.libvirtd.enable = true;
}
