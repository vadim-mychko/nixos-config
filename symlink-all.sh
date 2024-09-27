#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

"$SCRIPT_DIR/modules/sway/symlink.sh"
"$SCRIPT_DIR/modules/zathura/symlink.sh"
"$SCRIPT_DIR/modules/bat/symlink.sh"
"$SCRIPT_DIR/modules/kitty/symlink.sh"
