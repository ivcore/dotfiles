#!/bin/bash

set -e

CONFIGS="bash config nano/.nanorc zsh"
BASEDIR=$(dirname "$0")

function check_dotconfig {	
	if [ ! -d ~/.config ]; then
		echo "Creating ~/.config directory"
		mkdir ~/.config
	fi
}

check_dotconfig

cd $BASEDIR
if which stow &> /dev/null; then
	for name in $CONFIGS; do
		stow -R $name
	done
else
	echo "Stow isn't installed in your system. Please install it and try again."
fi

echo "Done!"

