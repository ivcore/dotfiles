#!/bin/bash

DOTFILES_ROOT="$(pwd)"

main() {
    if [ ! -d "$HOME/.config" ]; then
	mkdir --verbose "$HOME/.config"
    fi
    list_dotfiles | while read -r filename; do
	link_dotfile "$filename"
    done
    list_xdgconfigs | while read -r filename; do
	link_dotfile "$filename"
    done
}

link_dotfile() {
    DOT_FILE="$1"
    MOVE_OLD=0
    PERFORM=1
    # Remove any prefix up to the first slash
    FILE_NAME="${DOT_FILE#*/}"
    TARGET="$HOME/$FILE_NAME"

    if [ -e "$TARGET" ]; then
	if [ "$DOT_FILE" -ef "$TARGET" ]; then
	    PERFORM=0
	else
	    MOVE_OLD=1
	fi
    fi

    if [ "$MOVE_OLD" -eq 1 ]; then
	echo "Moving $TARGET to $TARGET.old"
	mv "$TARGET" "$TARGET.old"
    fi

    if [ "$PERFORM" -eq 1 ]; then
	echo "Linking $DOT_FILE to $TARGET"
	ln -s "$DOTFILES_ROOT/$FILE_NAME" "$TARGET"
    fi
}

list_dotfiles() {
    find . -maxdepth 1        \
	-not -name .           \
	-not -name .config     \
	-not -name .git        \
	-not -name .gitignore  \
	-not -name README.md   \
	-not -name install.sh
}

list_xdgconfigs() {
    find ./.config -maxdepth 1 \
	-not -name .config
}

main "$@"
