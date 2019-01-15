source ~/.prompt
source ~/.bash/git-completion.sh


export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export AWS_PROFILE=hu
export AWS_REGION=eu-west-1

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# ctrl-s (i-search)
stty -ixon


[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/z ] && . /usr/local/etc/z
export PATH="~/bin:/usr/local/sbin:$PATH"
