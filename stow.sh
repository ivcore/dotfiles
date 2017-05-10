#!/bin/bash

set -e

CONFIGS="bash config zsh"
BASEDIR=$(dirname "$0")

if [ ! -d $HOME/.config ]; then
	echo "Creating ~/.config directory"
	mkdir $HOME/.config
fi
cd $BASEDIR
if type stow &> /dev/null; then
	for name in $CONFIGS; do
		stow -R $name
	done
	echo "Done!"
else
	echo "Stow isn't installed in your system. Please install it and try again."
fi

