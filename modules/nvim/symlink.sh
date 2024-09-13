#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}"
NVIM_CONFIG_DIR="$CONFIG_DIR/nvim"

mkdir -pv "$NVIM_CONFIG_DIR"
ln -sv "$SCRIPT_DIR/init.lua" "$NVIM_CONFIG_DIR"
