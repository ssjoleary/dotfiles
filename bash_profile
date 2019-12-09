if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -d "$HOME/bin/platform-tools" ] ; then
    export PATH="$HOME/bin/platform-tools/adb-fastboot:$PATH"
fi

# ctrl-s (i-search)
# stty -ixon
