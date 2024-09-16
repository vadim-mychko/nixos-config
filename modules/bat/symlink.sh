#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
BAT_CONFIG_DIR=$(bat --config-dir)

mkdir -pv "$BAT_CONFIG_DIR"
mkdir -pv "$BAT_CONFIG_DIR/themes"
ln -sv "$SCRIPT_DIR/config" "$BAT_CONFIG_DIR"
ln -sv "$SCRIPT_DIR/modus_vivendi.tmTheme" "$BAT_CONFIG_DIR/themes"
