#!/usr/bin/env bash
sudo nixos-rebuild switch --flake $(dirname "$0")#vivobook
