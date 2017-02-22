#!/bin/bash

cd ~/dotfiles

for dir in ./*/; do
  for dotfiles in $dir.[!.]*; do
  	echo "Creating symlink to $dir in your home (~) directory."
    ln -s $dotfiles ~/$dotfiles
  done
done
