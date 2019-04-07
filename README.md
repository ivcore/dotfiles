> _I dream of the day when all our configs will be under one directory_

# Dotfiles
Say for a second you want to configure or customize a program (e.g. You want to
change the default background color of your terminal emulator). It is
certainly possible, right? But where is the configuration file saved? In
UNIX-like Operating Systems (GNU/Linux, BSD, macOS) those changes to the
default behaviour of a program are saved in files that are (usually) located in
your home (`$HOME` or `~`) directory.

You don't want those files and directories to be visible by default: someone
may misconfigure or delete them by mistake, or maybe they just cause some
visual noise. In order to hide them from the common sight, we put a dot (`.`)
at the start of their names. This indicates the OS that these files are hidden
by default. The
[origin](https://plus.google.com/+RobPikeTheHuman/posts/R58WgWwN9jp) of this
behavior is really interesting. That's where the name _dotfiles_ comes from.

Nowdays just some programs locate need their dotfiles in the `$HOME`
directory, thanks to the [XDG base directory
specification](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html).
This specification says that the user configurations must be located inside the
`$XDG_CONFIG_HOME`, which defaults to the `$HOME/.config/` directory. This way
~~most~~ all the config files are organized under one directory.

If you're gonna copy this dotfiles repository, I can't recommend enough you
first take the time to check the configuration files you're interested in, and
preferably just copy what you want and add it to your own files rather than
using the install script, as it will most likely override any previous files
you have.

## Install instructions
Download the repository, change the current working directory to the repo, run
the script:

```sh
git clone <git-repo-url> .dotfiles
cd .dotfiles
./install.sh
```
