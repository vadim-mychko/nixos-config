#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

"$SCRIPT_DIR/modules/foot/symlink.sh"
"$SCRIPT_DIR/modules/sway/symlink.sh"