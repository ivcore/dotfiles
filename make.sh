#!/bin/bash
############################

########## Variables

dir=~/dotfiles               # dotfiles directory
configs="bash git nano vim"  # list of files/folders to symlink in homedir

cd $dir

if type stow &> /dev/null; then
	for name in $configs; do
		echo "Creating symlink to $name in your home (~) directory."
		stow $name
	done
else
	echo "stow isn't installed in your system. Please install stow and try again. "
fi
