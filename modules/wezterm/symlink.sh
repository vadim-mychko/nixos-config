#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
WEZTERM_CONFIG_DIR="$CONFIG_DIR/wezterm"

mkdir -pv "$WEZTERM_CONFIG_DIR"
mkdir -pv "$WEZTERM_CONFIG_DIR/colors"
ln -sv "$SCRIPT_DIR/wezterm.lua" "$WEZTERM_CONFIG_DIR"
ln -sv "$SCRIPT_DIR/modus_vivendi.toml" "$WEZTERM_CONFIG_DIR/colors"
