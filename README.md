# Dotfiles
When you configure a program (for example, vim) the changes you do and the new configuration have got to be stored somewhere, right? Well, in UNIX and UNIX-like Operative Systems (like Linux and macOS) those configurations you make are stored in certain files that (usually) are located in your home (`~`) directory, and all of them, be either a file or a directory, start with a dot (`.`) hence the name, dotfiles.

If you're gonna copy this dotfiles repository I can't recommend enough you first take the time to check the configuration files you're interested in, and, preferably, just copy the information and add it to your own files rather than using the installation scripts, as they will most likely override any previous files you have.

## Install instructions
Download the repository:

    $ git clone https://github.com/ivcore/dotfiles.git
    
Change the current directory to the repo:

    $ cd dotfiles
    
Then you can run either `makestow.sh` (recommended method) if you have stow installed or `makescript.sh`.

    $ ./makestow.sh
    
Or

    $ ./makescript.sh
    
Be careful, tho, because it might overwrite any previous files (haven't tested it yet).

## to-do
- [ ] Add config files for `vim`
