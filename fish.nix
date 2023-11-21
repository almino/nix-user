{ pkgs, ... }:

{
  # https://nixos.wiki/wiki/Fish#Installation
  programs.fish.enable = true;
  programs.fish.shellAbbrs =
    let
      gc = "sudo nix-collect-garbage";
      nobuild = "--no-build-nix";
      pip = "sudo python3 -m pip";
      rebuild = "sudo nixos-rebuild";
      restart = "sudo systemctl kexec";
    in
    {
      artisan = "php artisan";
      full-switch = "${rebuild} switch ${nobuild}";
      nboot = "${rebuild} boot; and ${gc}";
      nreboot = "${rebuild} boot; and ${gc}; and ${restart}";
      nswitch = "${rebuild} switch ${nobuild}";
      ntest = "${rebuild} test ${nobuild}";
      pcp = "rsync -ah --progress";
      pip = pip;
      pip3 = pip;
      reboot = restart;
      restart = restart;
      rmf = "rm --force --recursive";
      rup = builtins.toString [
        "${rebuild} boot ${nobuild};"
        "and ${gc};"
        "and ${restart}"
      ];
      srmf = "sudo rm --interactive=once --recursive";
      targit = "tar --checkpoint=5 --create --xz --exclude-from=.gitignore --file";
      tarignore = "tar --checkpoint=5 --create --xz --exclude-from=.tarignore --file";
      tarxz = "tar --checkpoint=5 --create --xz --file";
      up = "${rebuild} switch ${nobuild} --upgrade-all";
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
