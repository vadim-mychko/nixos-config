#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
KITTY_CONFIG_DIR="$CONFIG_DIR/kitty"

mkdir -pv "$KITTY_CONFIG_DIR"
ln -sv "$SCRIPT_DIR/kitty.conf" "$KITTY_CONFIG_DIR"
