# Dotfiles
When you configure a program (for example, vim) the changes you do and the new configuration have got to be stored somewhere, right? Well, in UNIX and UNIX-like Operative Systems (like Linux and macOS) those configurations you make are stored in certain files that (usually) are located in your home (`~`) directory*, and all of them, be either a file or a directory, start with a dot (`.`) hence the name, dotfiles.

If you're gonna copy this dotfiles repository I can't recommend enough you first take the time to check the configuration files you're interested in, and, preferably, just copy the information and add it to your own files rather than using the installation scripts, as they will most likely override any previous files you have.

*Actually nowdays just _some_ (old) programs put need their dotfiles in the `~` directory, this is due to the [XDG base directory specification](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html). This specification says that the user configurations must be located inside the `$XDG_CONFIG_HOME`, which usually is just the `~/.config/` directory. This way ~~most~~ all the config files are organized under one directory.

## Understanding GNU Stow
As explained [here](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/), when you run `stow dir`, stow takes the content inside the `dir` directory, and symlinks the content to the parent directory (one directory **above**) of the one where the `stow dir` command was run.

## Install instructions
Download the repository, change the current working directory to the repo, run the script:

    $ git clone https://github.com/ivcore/dotfiles.git
    $ cd .dotfiles
    $ ./stow.sh

## to-do
- [ ] Fix `git-prompt.sh`
- [ ] Add syntax highlighting files for `nvim`

