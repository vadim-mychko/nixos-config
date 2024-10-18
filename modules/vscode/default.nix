{ pkgs, ... }:

let
  quarto = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "quarto";
    publisher = "quarto";
    version = "1.116.0";
    sha256 = "sha256-AwxBN4bu6EfCnozoDcM9BG8NGuG/1iaas7feLwgRC+w=";
  };
  python-indent = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vsc-python-indent";
    publisher = "KevinRose";
    version = "1.18.0";
    sha256 = "sha256-hiOMcHiW8KFmau7WYli0pFszBBkb6HphZsz+QT5vHv0=";
  };
  vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      quarto
      python-indent
      mkhl.direnv
      charliermarsh.ruff
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-toolsai.datawrangler
      valentjn.vscode-ltex
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      usernamehw.errorlens
      christian-kohler.path-intellisense
      tomoki1207.pdf
      mechatroner.rainbow-csv
    ];
  };
in {
  environment.systemPackages = [
    vscode
  ];
}
