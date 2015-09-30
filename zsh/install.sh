#!/bin/bash

set -e
cd ${0%/*}
source ../script/functions/*.sh

# install script here
symlink $(pwd)"/.zshrc" ~/.zshrc
