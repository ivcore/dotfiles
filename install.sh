#!/bin/bash
set -e

cd ~/dotfiles

if [ ! -d ~/.config ]; then
	echo "Creating ~/.config directory"
	mkdir ~/.config
fi

echo "Creating symlinks of XDG compliant programs"
cd config
for dir in */ ; do
	echo "$PWD/$dir ---> ~/.config"
	ln -sf $PWD/$dir ~/.config
done

