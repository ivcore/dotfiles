# Load ~/.profile regardless of shell version
if [ -e "$HOME"/.profile ] ; then
    . "$HOME"/.profile
fi

# If ~/.bashrc exists, source that too; the test for interactivity is in there.
if [ -f "$HOME"/.bashrc ] ; then
    . "$HOME"/.bashrc
fi
