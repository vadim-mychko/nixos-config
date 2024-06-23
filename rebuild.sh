#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
sudo nixos-rebuild switch --flake $DIR#vivobook
