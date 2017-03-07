#!/bin/bash

set -e

configs="bash config nano"
BASEDIR=$(dirname "$0")

function check_dotconfig {	
	if [ ! -d ~/.config ]; then
		echo "Creating ~/.config directory"
		mkdir ~/.config
	fi
}

check_dotconfig

cd $BASEDIR
if type stow &> /dev/null; then
	for dir in $configs; do
		stow -D $dir
		stow $dir
	done
else
	echo "Stow isn't installed in your system. Please install it and try again."
	echo "Although not recommended, you can try to use install.sh"
fi

