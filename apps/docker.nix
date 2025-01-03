{ pkgs, ... }:

{
  # !! NÃO altere as linhas ACIMA !!

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    docker
  ];

  virtualisation.docker = {
    # https://nixos.wiki/wiki/Docker#Installation:~:text=virtualisation.docker.enable
    enable = true;
    # https://search.nixos.org/options?channel=23.05&show=virtualisation.docker.enableOnBoot&from=0&size=50&sort=alpha_asc&type=packages&query=virtualisation.docker
    enableOnBoot = false;
  };

  # !! NÃO altere as linhas ABAIXO !!
}
