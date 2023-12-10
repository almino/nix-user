{ ... }:

{
  # https://github.com/nix-community/nix-direnv/blob/4132068df5153d44b7c17401ccefe54f99736dc1/README.md
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };
}