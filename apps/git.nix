{ lib, ... }:

# https://nixos.wiki/wiki/Home_Manager#Managing_your_dotfiles
# ~/.gitconfig
{
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
    userEmail = lib.mkDefault "almino.melo@gmail.com";
    userName = "Almino Melo";
  };
}