#!/bin/bash

rm ~/.zshenv
rm ~/.zshrc

ln -s $(pwd)/dot.zshenv ~/.zshenv
ln -s $(pwd)/dot.zshrc ~/.zshrc

