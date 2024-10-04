{ pkgs, ... }:

let
  basedpyright = pkgs.vscode-utils.extensionsFromVscodeMarketplace {
    name = "basedpyright";
    publisher = "detachhead";
    version = "1.18.3";
    sha256 = "";
  };
  vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      charliermarsh.ruff
      basedpyright
    ];
  };
in {
  environment.systemPackages = [
    vscode
  ];
}
