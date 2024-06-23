#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

mkdir -p "$HOME/.config"
ln -sfv "$SCRIPT_DIR/foot" "$HOME/.config"
ln -sfv "$SCRIPT_DIR/.zshrc" "$HOME"
ln -sfv "$SCRIPT_DIR/.gitconfig" "$HOME"
