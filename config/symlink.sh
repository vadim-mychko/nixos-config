#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))

ln -sf $DIR/foot $HOME/.config
ln -sf $DIR/.zshrc $HOME
ln -sf $DIR/.gitconfig $HOME
