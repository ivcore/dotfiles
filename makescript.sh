#!/bin/bash

cd ~/dotfiles

for dir in ./*/; do
  for dotfiles in $dir.[!.]*; do
    ln -s $dotfiles ~/$dotfiles
  done
done
