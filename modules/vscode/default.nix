{ pkgs, ... }:

let
  basedpyright = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "basedpyright";
    publisher = "detachhead";
    version = "1.18.3";
    sha256 = "sha256-zOYxcw2NnIaIrdP2/xg5uIvGynmWpljTof/F+J/EXis=";
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
