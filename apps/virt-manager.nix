{ pkgs, ... }:

{
  programs.virt-manager.enable = true;

  # programs.dconf.profiles.almino = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = [ "qemu:///system" ];
  #     uris = [ "qemu:///system" ];
  #   };
  # };

  users.users.almino = {
    extraGroups = [ "libvirt" ];
    # <binary path="/etc/profiles/per-user/almino/bin/virtiofsd" xattr="on"/>
    packages = [ pkgs.virtiofsd ];
  };

  virtualisation.libvirtd.enable = true;
}
