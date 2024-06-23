#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

ln -s $SCRIPT_DIR/foot $HOME/.config
ln -s $SCRIPT_DIR/.zshrc $HOME
ln -s $SCRIPT_DIR/.gitconfig $HOME
