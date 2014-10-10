#!/bin/bash
 
set -e
cd ${0%/*}
source ../script/functions/*.sh

# install script here
symlink $(pwd)"/.emacs.d" ~/.emacs.d

# aspell config file for flyspell-mode
if [ ! -e ~/.aspell.conf ]; then
  echo lang en_US > ~/.aspell.conf
fi
