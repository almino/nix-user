{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    (python3.withPackages (python-pkgs: with python-pkgs; [
      altair # visualização de dados
      beautifulsoup4
      black
      # pdf2docx # não funciona
      pip
      pyarrow
      pylance
      pypandoc
      pypdf
      python-frontmatter
      python-slugify
      regex
      # ruff # atrapalha o duncionamento do VS Code
      seaborn
      vl-convert-python
      werkzeug
    ]))
    ruff
    rustup
    ty
    uv
  ];
}
