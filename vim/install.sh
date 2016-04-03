#!/bin/bash

set -e
cd ${0%/*}
source ../script/functions/*.sh

# install script below 
symlink $(pwd)"/.vimrc" ~/.vimrc

# install NeoBundle 
if [ ! -e ~/.vim/bundle/repos/github.com/Shougo/dein.vim ]; then
    git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/repos/github.com/Shougo/dein.vim
fi

# add snippets
symlink $(pwd)"/.vim/snippets" ~/.vim/snippets
