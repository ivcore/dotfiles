#!/bin/bash
set -e

if [ ! -d ~/.config ]; then
	echo "Creating ~/.config directory"
	mkdir ~/.config
fi

echo "Creating symlinks of XDG compliant programs"
cd config/.config
for dir in * ; do

	if [ -L ~/.config/$dir ]; then
		echo " Existing $dir directory is a symlink. Removing."
		rm -r ~/.config/$dir
	elif [ -d ~/.config/$dir ]; then
		echo " Moving existing directory $dir to backup"
		mv -f ~/.config/$dir ~/dotfiles/backup/
	fi
	
	echo " Creating symlink of folder $dir in ~/.config"
	ln -sf $PWD/$dir ~/.config	
	
done
