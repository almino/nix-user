{ lib, pkgs, ... }:

{
  # https://nixos.wiki/wiki/Fish#Installation
  programs.fish = {
    enable = true;
    loginShellInit = ''
      set -xg BAT_THEME "Solarized ($term_background)"
    '';
    shellAbbrs =
      let
        backup-dir = "${tarxz} --file ../(${now}).(basename $PWD).tar.xz (/run/current-system/sw/bin/ls -A $PWD)";
        barWithLogs = "--log-format bar-with-logs";
        gc = "sudo nix-collect-garbage";
        gitPull = "git pull --recurse-submodules --autostash";
        gitPush = "git push --progress --recurse-submodules=on-demand";
        gitUp = "${gitPull}; and ${gitPush}";
        hms = "home-manager switch --no-out-link -b (date +\"%Y%m%d-%H%M%S\"); and ${unlink}";
        noBuildOutput = "--no-build-output";
        noBuildSystem = "--no-build-nix";
        now = "date +\"%Y-%m-%d--%H-%M-%S\"";
        # pip = "sudo python3 -m pip";
        rebuild = "sudo nixos-rebuild";
        restart = "sudo reboot";
        screen-backup-dir = "screen sh -c \"${backup-dir}\"";
        tarxz = "tar --checkpoint=1500 --create --xz";
        tmux = "tmux";
        tup = "${rebuild} test ${noBuildOutput} ${noBuildSystem} ${barWithLogs} ${up}; and ${unlink}";
        up = "--upgrade-all";
        unlink = "unlink result";
      in
      {
        backup-dir = lib.mkDefault backup-dir;
        bd = lib.mkDefault backup-dir;
        diren = lib.mkDefault "direnv";
        full-switch = lib.mkDefault "${rebuild} switch ${noBuildOutput} ${noBuildSystem} ${barWithLogs}; and ${unlink}";
        gc = lib.mkDefault gc;
        gitup = lib.mkDefault gitUp;
        gpull = lib.mkDefault gitPull;
        gpush = lib.mkDefault gitPush;
        hms = lib.mkDefault hms;
        ifdown = lib.mkDefault "sudo ip link set eno1 down";
        ifup = lib.mkDefault "sudo ip link set eno1 up";
        ip = lib.mkDefault "ip --color a";
        ls = lib.mkDefault "eza -lAgh";
        nboot = lib.mkDefault "${gc}; and ${rebuild} boot ${noBuildOutput} ${barWithLogs}; and ${gc}; and ${unlink}";
        nbootup = lib.mkDefault "${gc}; and ${rebuild} boot ${noBuildOutput} ${up} ${barWithLogs}; and ${gc}; and ${unlink}";
        nix-config = lib.mkDefault "tmux new -A -s nixos -c (dirname (readlink --canonicalize --no-newline /etc/nixos/configuration.nix))";
        noff = lib.mkDefault "${rebuild} test ${noBuildOutput} ${barWithLogs} --option binary-caches \"\" --option substitute false; and ${unlink}";
        nreboot = lib.mkDefault "${rebuild} boot ${noBuildOutput} ${noBuildSystem} ${barWithLogs}; and ${gc}; and ${restart}; and ${unlink}";
        nswitch = lib.mkDefault "${rebuild} switch ${noBuildOutput} ${noBuildSystem} ${barWithLogs}; and ${unlink}";
        ntest = lib.mkDefault "${rebuild} test ${noBuildOutput} ${noBuildSystem} ${barWithLogs}; and ${unlink}";
        ntup = lib.mkDefault tup;
        pcp = lib.mkDefault "rsync -ah --progress";
        # pip = lib.mkDefault pip;
        # pip3 = lib.mkDefault pip;
        reboot = lib.mkDefault restart;
        restart = lib.mkDefault restart;
        rmf = lib.mkDefault "rm --force --recursive";
        rpull = "git pull --recurse-submodules";
        rup = lib.mkDefault (builtins.toString [
          "${rebuild} boot ${noBuildOutput} ${noBuildSystem} ${barWithLogs} ${up};"
          "and ${gc};"
          "and ${restart}"
          "and ${unlink}"
        ]);
        sbackup-dir = lib.mkDefault screen-backup-dir;
        sbd = lib.mkDefault screen-backup-dir;
        service = lib.mkDefault "sudo service";
        srmf = lib.mkDefault "sudo rm --interactive=once --recursive";
        stash = lib.mkDefault "git stash -u -m \"\"";
        targit = lib.mkDefault "tar --checkpoint=5 --create --xz --exclude-from=.gitignore --file";
        tarignore = lib.mkDefault "tar --checkpoint=5 --create --xz --exclude-from=.tarignore --file";
        tarxz = lib.mkDefault "tar --checkpoint=5 --create --xz --file";
        temux = tmux;
        termux = tmux;
        tup = lib.mkDefault tup;
        up = lib.mkDefault "${rebuild} switch ${noBuildOutput} ${noBuildSystem} ${barWithLogs} ${up}; and ${unlink}";
        upgit = lib.mkDefault gitUp;
      };
    useBabelfish = true;
  };

  programs.starship = {
    enable = true;
    presets = [
      "plain-text-symbols"
      "no-runtime-versions"
      # "tokyo-night"
      "gruvbox-rainbow"
      # "catppuccin-powerline"
    ];
    # settings = {
    #   palette = "catppuccin";
    # };
  };

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
    starship
  ];
}
