#!/bin/bash

set -e
cd ${0%/*}
source ../script/functions/*.sh

# install script below 
symlink $(pwd)"/.vimrc" ~/.vimrc

# install vim-plug 
if [ ! -e ~/.vim/bundle/github.com/junegunn/vim-plug ]; then
    git clone https://github.com/junegunn/vim-plug ~/.vim/bundle/junegunn/vim-plug/autoload/
fi

# add snippets
symlink $(pwd)"/.vim/snippets" ~/.vim/snippets
