{ lib, pkgs, ... }:

# https://discourse.nixos.org/t/is-nixos-affected-by-copy-fail-edit-yes-it-is/77317/17
{
  boot.blacklistedKernelModules = [
    "af_alg"
    "algif_hash"
    "algif_skcipher"
    "algif_rng"
    "algif_aead"
  ];

  boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.18.22")
    (
      lib.mkDefault pkgs.linuxPackages_6_18
    );
}
