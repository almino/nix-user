# https://mipmip.github.io/home-manager-option-search/?query=programs.zoxide
{ pkgs, ... }:

{
  programs.tmux = {
    baseIndex = 1;
    clock24 = true;
    enable = true;
    extraConfig = ''
      set -g @catppuccin_flavor 'macchiato' # latte, frappe, macchiato or mocha
    '';
    newSession = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      catppuccin
      copy-toolkit
      mode-indicator
      net-speed
      better-mouse-mode
      tmux-fzf
    ];
  };


  # Somente meu usuário
  users.users.almino.packages = with pkgs; [
    tmuxp
  ];
}
