#!/bin/bash
# Emits various SGR sequences to test terminals to ensure that everything works
# as expected.
#
# Taken from https://youtu.be/9DgQqDnYNyQ?t=380.

bold() { ansi 1 "$@"; }
italic() { ansi 3 "$@"; }
underline() { ansi 4 "$@"; }
strikethrough() { ansi 9 "$@"; }
ansi() { printf "\e[${1}m${*:2}\e[0m"; }

echo "bold = $(bold bold)"
echo "italic = $(italic italic)"
echo "underline = $(underline underline)"
echo "strikethrough = $(strikethrough strikethrough)"
