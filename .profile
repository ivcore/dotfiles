# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    XKB_DEFAULT_LAYOUT=us exec sway
fi

# Keep around 4K lines of history in memory
HISTSIZE=$((1 << 12))

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's Go bin if it exists
if [ -d "$HOME/go" ] ; then
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    PATH="$PATH:$GOBIN"
fi

# set PATH so it includes user's Rust bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes user's Node bin if it exists
if [ -d "$HOME/.yarn/bin" ] ; then
    PATH="$PATH:$HOME/.yarn/bin"
fi

# If ~/.shinit exists, set ENV to that
if [ -f "$HOME"/.shinit ] ; then
    ENV=$HOME/.shinit
    export ENV
fi
