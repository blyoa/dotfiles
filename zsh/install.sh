#!/bin/bash

set -e
cd ${0%/*}
source ../script/functions/*.sh

# install script here

# install zplug
curl -sL zplug.sh/installer | zsh

symlink $(pwd)"/.zshrc" ~/.zshrc
