{ pkgs, ... }:

{
  # https://nixos.wiki/wiki/Fish#Installation
  programs.fish.enable = true;
  programs.fish.shellAbbrs =
    let
      gc = "sudo nix-collect-garbage";
      noBuild = "--no-build-nix";
      pip = "sudo python3 -m pip";
      rebuild = "sudo nixos-rebuild";
      restart = "sudo systemctl kexec";
    in
    {
      full-switch = "${rebuild} switch ${noBuild}";
      gc = gc;
      nboot = "${rebuild} boot; and ${gc}";
      nreboot = "${rebuild} boot ${noBuild}; and ${gc}; and ${restart}";
      nswitch = "${rebuild} switch ${noBuild}";
      ntest = "${rebuild} test ${noBuild}";
      pcp = "rsync -ah --progress";
      pip = pip;
      pip3 = pip;
      reboot = restart;
      restart = restart;
      rmf = "rm --force --recursive";
      rup = builtins.toString [
        "${rebuild} boot ${noBuild};"
        "and ${gc};"
        "and ${restart}"
      ];
      srmf = "sudo rm --interactive=once --recursive";
      targit = "tar --checkpoint=5 --create --xz --exclude-from=.gitignore --file";
      tarignore = "tar --checkpoint=5 --create --xz --exclude-from=.tarignore --file";
      tarxz = "tar --checkpoint=5 --create --xz --file";
      up = "${rebuild} switch ${noBuild} --upgrade-all";
    };

  users.users.almino.packages = with pkgs; [
    fish
    fishPlugins.colored-man-pages
    fishPlugins.fzf-fish # Ctrl + Alt + {P,S,L,F}
    fishPlugins.grc # colors
    fishPlugins.pisces # VS-Code-like terminal
    fishPlugins.puffer # .. !! !$
    fzf
    grc
  ];
}
