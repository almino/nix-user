{ lib, pkgs, ... }:

{
  # https://nixos.wiki/wiki/Fish#Installation
  programs.fish.enable = true;
  programs.fish.shellAbbrs =
    let
      backup-dir = "${tarxz} --file ../(${now}).(basename $PWD).tar.xz (/run/current-system/sw/bin/ls -A $PWD)";
      gc = "sudo nix-collect-garbage";
      gitPull = "git pull --recurse-submodules --autostash";
      gitPush = "git push --progress --recurse-submodules=on-demand";
      gitUp = "${gitPull}; and ${gitPush}";
      hms = "home-manager switch --no-out-link -b (date +\"%Y%m%d-%H%M%S\")";
      noBuild = "--no-build-nix";
      now = "date +\"%Y-%m-%d--%H-%M-%S\"";
      pip = "sudo python3 -m pip";
      rebuild = "sudo nixos-rebuild";
      restart = "sudo systemctl kexec";
      screen-backup-dir = "screen sh -c \"${backup-dir}\"";
      tarxz = "tar --checkpoint=1500 --create --xz";
      up = "--upgrade-all";
    in
    {
      backup-dir = lib.mkDefault backup-dir;
      bd = lib.mkDefault backup-dir;
      diren = lib.mkDefault "direnv";
      full-switch = lib.mkDefault "${rebuild} switch ${noBuild}";
      gc = lib.mkDefault gc;
      gitup = lib.mkDefault gitUp;
      gpull = lib.mkDefault gitPull;
      gpush = lib.mkDefault gitPush;
      hms = lib.mkDefault hms;
      ip = lib.mkDefault "ip --color a";
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
      rpull = "git pull --recurse-submodules";
      rup = lib.mkDefault (builtins.toString [
        "${rebuild} boot ${noBuild} ${up};"
        "and ${gc};"
        "and ${restart}"
      ]);
      sbackup-dir = lib.mkDefault screen-backup-dir;
      sbd = lib.mkDefault screen-backup-dir;
      srmf = lib.mkDefault "sudo rm --interactive=once --recursive";
      stash = lib.mkDefault "git stash -u -m \"\"";
      targit = lib.mkDefault "tar --checkpoint=5 --create --xz --exclude-from=.gitignore --file";
      tarignore = lib.mkDefault "tar --checkpoint=5 --create --xz --exclude-from=.tarignore --file";
      tarxz = lib.mkDefault "tar --checkpoint=5 --create --xz --file";
      up = lib.mkDefault "${rebuild} switch ${noBuild} ${up}";
      upgit = lib.mkDefault gitUp;
    };

  programs.starship.enable = true;

  # Somente meu usuário
  users.users.almino.packages = with pkgs; [
    fd # An alternative to find (Ctrl + Alt + F)
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
