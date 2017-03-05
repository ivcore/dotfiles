# Dotfiles
When you configure a program (for example, vim) the changes you do and the new configuration have got to be stored somewhere, right? Well, in UNIX and UNIX-like Operative Systems (like Linux and macOS) those configurations you make are stored in certain files that (usually) are located in your home (`~`) directory*, and all of them, be either a file or a directory, start with a dot (`.`) hence the name, dotfiles.

If you're gonna copy this dotfiles repository I can't recommend enough you first take the time to check the configuration files you're interested in, and, preferably, just copy the information and add it to your own files rather than using the installation scripts, as they will most likely override any previous files you have.

*Actually nowdays just _some_ (old) programs put need their dotfiles in the `~` directory, this is due to the [XDG base directory specification](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html). This Standard says that the user configurations must be located inside the `$XDG_CONFIG_HOME`, which usually is just the `~/.config/` directory. This way ~~most~~ all the config files are organized under one directory.

## Install instructions
Download the repository:

    $ git clone https://github.com/ivcore/dotfiles.git
    
Change the current directory to the repo:

    $ cd dotfiles
    
Then you can run either `install.sh` (recommended method) or if you have stow installed `installstow.sh`.

    $ ./install.sh
    
Or

    $ ./installstow.sh

Note that, when using `install.sh` all previous config files that aren't symlinks will be moved to `~/dotfiles/backup`
## to-do
- [ ] Fix `install.sh` so it works for everything outside of `/dotfiles/config/`
- [ ] Fix `git-prompt.sh`
- [ ] Add syntax highlighting files for `nvim`

