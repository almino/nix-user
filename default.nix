{ ... }:

{
  environment.shellAliases = {
    ls = "exa -lh";
    now = "date +\"%Y-%m-%d--%H-%M-%S\"";
  };

  imports = [
    ./fish.nix
    ./nfs.nix
    ./user.nix
  ];
}
