{ pkgs, ... }:

let
  quarto = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "quarto";
    publisher = "quarto";
    version = "1.115.0";
    sha256 = "sha256-LTgeVDZSgwK/m4sXbVynyXnPnni41jbFAyxkhh0WBKY=";
  };
  python-indent = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vsc-python-indent";
    publisher = "KevinRose";
    version = "1.18.0";
    sha256 = "";
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
      vscodevim.vim
      reditorsupport.r
      usernamehw.errorlens
      christian-kohler.path-intellisense
      ms-vscode.live-server
      tomoki1207.pdf
    ];
  };
in {
  environment.systemPackages = [
    vscode
  ];
}
