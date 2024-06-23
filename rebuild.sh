#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

sudo nixos-rebuild switch --flake $SCRIPT_DIR#vivobook
