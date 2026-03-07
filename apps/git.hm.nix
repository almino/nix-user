{ lib, ... }:

# https://nixos.wiki/wiki/Home_Manager#Managing_your_dotfiles
# ~/.gitconfig
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        email = lib.mkDefault "almino.melo@gmail.com";
        name = lib.mkDefault "Almino Melo";
      };
    };
  };
}
