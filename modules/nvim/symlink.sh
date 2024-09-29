#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
VALE_CONFIG_DIR="$CONFIG_DIR/vale"

mkdir -pv "$VALE_CONFIG_DIR"
ln -sv "$SCRIPT_DIR/lintr" "$HOME/.lintr"
ln -sv "$SCRIPT_DIR/vale.ini" "$VALE_CONFIG_DIR/.vale.ini"
vale sync --config="$VALE_CONFIG_DIR/.vale.ini"
