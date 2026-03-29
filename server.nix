{ lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # eza # base.nix
    # htop # base.nix
    lsof
  ];

  imports = [ ./base.nix ./www-data.nix ];

  # Para usar o VS Code via SSH
  programs.nix-ld.enable = true;

  services.mysql.ensureUsers = [{
    name = "almino";
    ensurePermissions."*.*" = "ALL";
  }];

  users.users.almino = {
    isNormalUser = lib.mkDefault true;
    packages = with pkgs; [
      bat
      uv # MCP NixOS no VS Code
    ];
  };
}
