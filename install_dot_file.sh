#!/bin/bash

rm ~/.zshenv
rm ~/.zshrc
rm ~/.gitconfig 
rm ~/.vimrc

ln -s $(pwd)/dot.zshenv ~/.zshenv
ln -s $(pwd)/dot.zshrc ~/.zshrc
ln -s $(pwd)/dot.gitconfig ~/.gitconfig
ln -s $(pwd)/dot.vimrc ~/.vimrc
ln -s $(pwd)/.Xdefaults ~/.Xdefaults
ln -s $(pwd)/xmonad.hs ~/.xmonad/xmonad.hs

