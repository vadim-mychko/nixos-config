#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

"$SCRIPT_DIR/foot/symlink.sh"
"$SCRIPT_DIR/sway/symlink.sh"
