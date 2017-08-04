source ~/.prompt
source ~/.bash/git-completion.sh

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

eval $(gpg-agent --daemon)
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# ctrl-s (i-search)
stty -ixon

export PATH=~/bin:$PATH
