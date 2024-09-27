#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

ln -sv "$SCRIPT_DIR/template.txt" "$HOME/.gitcommit"
