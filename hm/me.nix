{ config, lib, pkgs, ... }:

let
  defaultHomeManager = import ../fn/home-manager.nix
    { inherit config lib pkgs; };
in

defaultHomeManager "almino" {
  imports = [
    ../apps/direnv.nix
    ../apps/git.nix
    ../apps/telegram.981.nix
    ../apps/zoxide.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # fish-vars = {
    #   source = ../dotfiles/fish-vars;
    #   target = ".config/fish/fish_variables";
    # };

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # starship = {
    #   source = ../dotfiles/starship.toml;
    #   target = ".config/starship.toml";
    # };

    # telegramStartup = {
    #   source = ../autostart/org.telegram.desktop.desktop;
    #   target = ".config/autostart/org.telegram.desktop.desktop";
    # };
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/almino/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.firefox.profiles = {
    personal = (import ../apps/firefox/personal.nix
      { inherit lib pkgs; }) // {
      isDefault = true;
    };
  };

  programs.gh = import ../apps/gh.nix;
}
