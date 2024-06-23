#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"

mkdir -pv "$CONFIG_DIR"
ln -sfv "$SCRIPT_DIR/foot" "$CONFIG_DIR"
ln -sfv "$SCRIPT_DIR/.zshrc" "$HOME"
ln -sfv "$SCRIPT_DIR/.tmux.conf" "$HOME"
