#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

ln -sf $SCRIPT_DIR/foot $HOME/.config
ln -sf $SCRIPT_DIR/.zshrc $HOME
ln -sf $SCRIPT_DIR/.gitconfig $HOME
