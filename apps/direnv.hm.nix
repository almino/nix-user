{ ... }:

{
  # https://github.com/direnv/direnv/wiki/Python#uv
  home.file.python_uv = {
    text = ''
      layout_uv() {
        if [[ -d ".venv" ]]; then
            VIRTUAL_ENV="$(pwd)/.venv"
        fi

        if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
            log_status "No virtual environment exists. Executing \`uv venv\` to create one."
            uv venv
            VIRTUAL_ENV="$(pwd)/.venv"
        fi

        PATH_add "$VIRTUAL_ENV/bin"
        export UV_ACTIVE=1  # or VENV_ACTIVE=1
        export VIRTUAL_ENV
      }
    '';
  };

  # https://github.com/nix-community/nix-direnv/blob/4132068df5153d44b7c17401ccefe54f99736dc1/README.md
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };
}
