#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
FOOT_CONFIG_DIR="$CONFIG_DIR/foot"

mkdir -pv "$FOOT_CONFIG_DIR"
ln -sfv "$SCRIPT_DIR/foot.ini" "$FOOT_CONFIG_DIR"
