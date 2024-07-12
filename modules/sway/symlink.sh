#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
SWAY_CONFIG_DIR="$CONFIG_DIR/sway"

mkdir -pv "$SWAY_CONFIG_DIR"
ln -sfv "$SCRIPT_DIR/config" "$SWAY_CONFIG_DIR"
