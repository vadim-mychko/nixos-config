#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

"$SCRIPT_DIR/modules/bat/symlink.sh"
"$SCRIPT_DIR/modules/git/symlink.sh"
"$SCRIPT_DIR/modules/nvim/symlink.sh"
"$SCRIPT_DIR/modules/wezterm/symlink.sh"
