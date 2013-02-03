#!/bin/bash

rm ~/.zshenv
rm ~/.zshrc
rm ~/.gitconfig 

ln -s $(pwd)/dot.zshenv ~/.zshenv
ln -s $(pwd)/dot.zshrc ~/.zshrc
ln -s $(pwd)/dot.gitconfig ~/.gitconfig

