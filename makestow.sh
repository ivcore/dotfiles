#!/bin/bash

configs="bash git nano vim"  # list of files/folders to symlink in homedir

cd ~/dotfiles 

if type stow &> /dev/null; then
	for name in $configs; do
		echo "Creating symlink to $name in your home (~) directory."
		stow $name
	done
else
	echo "Stow isn't installed in your system. Please install stow and try again. "
fi
