# https://mipmip.github.io/home-manager-option-search/?query=programs.zoxide
{ pkgs, ... }:

{
  programs.tmux = {
    baseIndex = 1;
    clock24 = true;
    enable = true;
    newSession = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      mode-indicator
      net-speed
      tmux-fzf
    ];
  };


  # Somente meu usuário
  users.users.almino.packages = with pkgs; [
    tmuxp
  ];
}
