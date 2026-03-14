{ lib, ... }:

{
  # https://wiki.nixos.org/wiki/Podman
  virtualisation = {
    containers.enable = lib.mkDefault true;
    oci-containers.backend = lib.mkDefault "podman";
    podman = {
      enable = lib.mkDefault true;
      dockerCompat = lib.mkDefault true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = lib.mkDefault true;
    };
  };

  users.users.almino = {
    extraGroups = [
      "podman"
    ];
  };
}
