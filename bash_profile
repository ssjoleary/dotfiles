source ~/.prompt
source ~/.bash/git-completion.sh

export GEM_HOME=$HOME/.gem/ruby/2.5.0
export PATH="$PATH:$HOME/bin:/usr/local/sbin:$GEM_HOME/bin:/usr/local/opt/terraform@0.11/bin:$HOME/.cargo/bin:usr/local/opt/python@2/libexec/bin"
export AWS_PROFILE=hu
export AWS_REGION=eu-west-1
export HOMEBREW_GITHUB_API_TOKEN=xxx

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# ctrl-s (i-search)
stty -ixon


[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/z ] && . /usr/local/etc/z
