{ pkgs, ... }:

let
  python-indent = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vsc-python-indent";
    publisher = "KevinRose";
    version = "1.18.0";
    sha256 = "sha256-hiOMcHiW8KFmau7WYli0pFszBBkb6HphZsz+QT5vHv0=";
  };

  edit-csv = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-edit-csv";
    publisher = "janisdd";
    version = "0.10.0";
    sha256 = "sha256-+sdlEpBpsy4l4wL1gi+ONCi5de9mX4eP85HC9dsuc5Q=";
  };

  vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      python-indent
      edit-csv
      mkhl.direnv
      charliermarsh.ruff
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-toolsai.datawrangler
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      usernamehw.errorlens
      christian-kohler.path-intellisense
      tomoki1207.pdf
      mechatroner.rainbow-csv
      catppuccin.catppuccin-vsc
    ];
  };
in {
  environment.systemPackages = [
    vscode
  ];
}
