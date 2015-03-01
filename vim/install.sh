#!/bin/bash

set -e
cd ${0%/*}
source ../script/functions/*.sh

# install script below 
symlink $(pwd)"/.vimrc" ~/.vimrc

# install NeoBundle 
if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# add snippets
symlink $(pwd)"/.vim/snippets" ~/.vim/snippets
