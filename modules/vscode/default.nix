{ pkgs, ... }:

let
  vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      charliermarsh.ruff
      ms-toolsai.jupyter
      valentjn.vscode-ltex
      ms-python.python
      ms-python.vscode-pylance
    ];
  };
in {
  environment.systemPackages = [
    vscode
  ];
}
