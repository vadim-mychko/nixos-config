#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
ZATHURA_CONFIG_DIR="$CONFIG_DIR/zathura"

mkdir -pv "$ZATHURA_CONFIG_DIR"
ln -sv "$SCRIPT_DIR/zathurarc" "$ZATHURA_CONFIG_DIR"
