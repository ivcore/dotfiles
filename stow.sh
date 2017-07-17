#!/bin/bash
#
# Create simlinks to configuration files using GNU Stow (if available).
set -e

CONFIGS="bash config tmux zsh"
BASEDIR="$(dirname "$0")"

if [[ ! -d "${HOME}/.config" ]]; then
  echo "Create .config/ directory."
  mkdir "${HOME}/.config"
fi
cd ${BASEDIR}
if type stow &> /dev/null; then
  for name in "${CONFIGS}"; do
    stow -R "${name}"
  done
  echo "Done!"
else
  echo "Stow isn't installed in your system. Please install it and try again."
fi
