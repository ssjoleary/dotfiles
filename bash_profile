source ~/.prompt
source ~/.bash/git-completion.sh

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# ctrl-s (i-search)
stty -ixon

export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export AWS_PROFILE=hu
export AWS_REGION=eu-west-1
