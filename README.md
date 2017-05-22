> _I dream of the day when all our configs will be under one directory_

# Dotfiles
Say for a second you want to configure or customize a program
(e.g. You want to change the default background color of your terminal emulator).
It is certainly possible, right? But where is the configuration file saved?
In UNIX and UNIX-like Operative Systems (GNU/Linux, BSD, macOS)
those changes to the default behaviour of a program are saved in files that are (usually) located in your home (`$HOME` or `~`) directory.

You don't want those files and directories to be visible by default:
someone may misconfigure them or delete them mistakenly, or maybe they just cause some visual noise.
In order to hide them from the common sight, we put a dot (`.`) at the start of their names.
This indicates the OS that these files are hidden by default,
The [origin](https://plus.google.com/+RobPikeTheHuman/posts/R58WgWwN9jp) of this behavior is really interesting.
That's where the name _dotfiles_ comes from.

Nowdays just some (old) programs locate need their dotfiles in the `$HOME` directory,
thanks to the [XDG base directory specification](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html).
This specification says that the user configurations must be located inside the `$XDG_CONFIG_HOME`,
which is just the `$HOME/.config/` directory.
This way ~~most~~ all the config files are organized under one directory.

If you're gonna copy this dotfiles repository,
I can't recommend enough you first take the time to check the configuration files you're interested in, 
and preferably just copy what you want and add it to your own files rather than using the install script,
as it will most likely override any previous files you have.

##GNU Stow

### Understanding GNU Stow
Imagine you have the the directory:

`/trunk/branch/subbranch/leaf`

According to this great [explanation](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/),
when you are in the `/branch` directory and run

`$ stow subbranch`

Stow takes the content inside the `/subbranch` directory (i.e. `leaf`),
and symlinks it to the parent directory of the one where command was run (i.e. `/trunk`). 

Now your `/trunk` directory has a symbolic link (similar to a direct access) to the `leaf` file.

## Install instructions
Download the repository, change the current working directory to the repo, run the script:

    $ git clone https://github.com/ivcore/.dotfiles.git
    $ cd .dotfiles
    $ ./stow.sh

## to-do
- [ ] Improve README.md
- [ ] Add short descriptions of configs

