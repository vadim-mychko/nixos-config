{ pkgs, ... }:

let
  quarto = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "quarto";
    publisher = "quarto";
    version = "1.115.0";
    sha256 = "sha256-LTgeVDZSgwK/m4sXbVynyXnPnni41jbFAyxkhh0WBKY=";
  };
  vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      quarto
      mkhl.direnv
      charliermarsh.ruff
      ms-toolsai.jupyter
      valentjn.vscode-ltex
      ms-python.python
      ms-python.vscode-pylance
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
