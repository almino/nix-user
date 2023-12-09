# https://nixos.wiki/wiki/Home_Manager#Managing_your_dotfiles
# ~/.gitconfig
{
  enable = true;
  # gitCredentialHelper = {
  #   enable = true;
  #   hosts = [ "https://github.com" ];
  # };
  settings = {
    # What protocol to use when performing git operations. Supported values: ssh, https
    git_protocol = "ssh";
    # When to interactively prompt. This is a global config that cannot be overridden by hostname. Supported values: enabled, disabled
    prompt = "enabled";
  };
}