#!/bin/bash
#
# Create simlinks to configuration files using GNU Stow (if available).
set -e

CONFIGS="bash config nano tmux zsh"
BASEDIR="$(dirname "$0")"

if [[ ! -d "${HOME}"/.config ]]; then
  echo "Create .config/ directory."
  mkdir "${HOME}"/.config
fi

if type stow &> /dev/null; then
  for name in ${CONFIGS}; do
    stow -d "${BASEDIR}" -t "${HOME}" -R -v --adopt "${name}"
  done
  echo "Done!"
	exit 0
else
  echo "Stow isn't installed in your system. Please install it and try again."
	exit 1
fi
