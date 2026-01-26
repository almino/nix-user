{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    (python3.withPackages (python-pkgs: with python-pkgs; [
      altair # visualização de dados
      beautifulsoup4
      black
      fastapi
      # pdf2docx # não funciona
      pip
      pyarrow
      pydantic
      pylance
      pypandoc
      pypdf
      python-frontmatter
      python-slugify
      regex
      # ruff # atrapalha o duncionamento do VS Code
      seaborn
      sqlmodel
      typer
      uvicorn
      vl-convert-python
      werkzeug
    ]))
    ruff
    rustup
    ty
    uv
  ];
}
