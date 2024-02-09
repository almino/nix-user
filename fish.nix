{ lib, pkgs, ... }:

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
      tarxz = "tar --checkpoint=1500 --create --xz";
      up = "--upgrade-all";
    in
    {
      backup-dir = lib.mkDefault "${tarxz} --file ../(now).(basename $PWD).tar.xz (/run/current-system/sw/bin/ls -A $PWD)";
      full-switch = lib.mkDefault "${rebuild} switch ${noBuild}";
      gc = lib.mkDefault gc;
      nboot = lib.mkDefault "${rebuild} boot; and ${gc}";
      nreboot = lib.mkDefault "${rebuild} boot ${noBuild}; and ${gc}; and ${restart}";
      nswitch = lib.mkDefault "${rebuild} switch ${noBuild}";
      ntest = lib.mkDefault "${rebuild} test ${noBuild}";
      pcp = lib.mkDefault "rsync -ah --progress";
      pip = lib.mkDefault pip;
      pip3 = lib.mkDefault pip;
      reboot = lib.mkDefault restart;
      restart = lib.mkDefault restart;
      rmf = lib.mkDefault "rm --force --recursive";
      rup = lib.mkDefault builtins.toString [
        "${rebuild} boot ${noBuild} ${up};"
        "and ${gc};"
        "and ${restart}"
      ];
      srmf = lib.mkDefault "sudo rm --interactive=once --recursive";
      stash = lib.mkDefault "git stash -u -m \"\"";
      targit = lib.mkDefault "tar --checkpoint=5 --create --xz --exclude-from=.gitignore --file";
      tarignore = lib.mkDefault "tar --checkpoint=5 --create --xz --exclude-from=.tarignore --file";
      tarxz = lib.mkDefault "tar --checkpoint=5 --create --xz --file";
      up = lib.mkDefault "${rebuild} switch ${noBuild} ${up}";
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
