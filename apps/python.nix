{ pkgs, ... }:

{
  users.users.almino.packages = with pkgs; [
    (python3.withPackages (python-pkgs: with python-pkgs; [
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
      werkzeug
      # regex
      virtualenv
    ]))
    rustup
    uv
  ];
}
