source ~/.prompt

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/go"
if [ -d "$HOME/bin/platform-tools" ] ; then
    export PATH="$HOME/bin/platform-tools:$PATH"
fi

alias refresh='source ~/.bashrc'
alias v="nvim"

new_tmux_session() {
	tmux new -s "$1"
}

alias tn=new_tmux_session

attach_tmux_session() {
	tmux attach -t "$1"
}

alias ta=attach_tmux_session

list_tmux_sessions() {
	tmux ls
}

alias tl=list_tmux_sessions

show_help() {
	echo "
	ctrl-a      - move the cursor to the beginning of the current line
	ctrl-e      - move the cursor to the end of the current line
	alt-b       - move the cursor backwards one word
	alt-f       - move the cursor forward one word
	ctrl-k      - delete from cursor to the end of the line
	ctrl-u      - delete from cursor to the beginning of the line
	alt-d       - delete the word in front of the cursor
	ctrl-w      - delete the word behind of the cursor

	pbcopy      - copy to clipboard
	pbpaste     - paste from clipboard
	cd -        - change into most recently accessed directory
	pushd <dir> - add current directory to stack & move
	popd <dir>  - move to top directory in stack

	ctrl-z      - stops current job
	fg          - moves most recent job to foreground
	bg          - moves most recent job to background
	disown -h   - detach process from shell
	jobs -l     - lists jobs
	"
}

alias hint=show_help

git_hint() {
	echo "
	git pull origin develop --rebase        - whilst on you're on your feature branch
	git reset --hard origin/[branch]        - reset branch after someone else has git push -f
	"
}

alias git_hint=git_hint

alias prettyjson='python -m json.tool'

alias lein_what=lein_what

lein_what() {
  echo "
  ancient      - A Leiningen plugin to check your project for outdated dependencies and plugins.
  eastwood     - Eastwood is a Clojure lint tool that uses the tools.analyzer and tools.analyzer.jvm libraries to inspect namespaces and report possible problems.
  kibit        - kibit is a static code analyzer for Clojure, ClojureScript, cljx and other Clojure variants.
  bikeshed     - A Leiningen plugin designed to tell you your code is bad, and that you should feel bad.
  deps-tree    - Prints a nicely formatted tree of all project dependencies
  cljfmt check - A tool for formatting Clojure code
  "
}
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    if [[ ${EUID} == 0 ]] ; then
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
#    else
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
#    fi
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"
#
# Sensible Bash
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

shopt -s autocd
shopt -s dirspell
shopt -s cdspell

CDPATH=".:~/Documents/workspace"

shopt -s cdable_vars
# Don't use ~ to define your home here, it won't work.
export dotfiles="$HOME/Documents/workspace/dotfiles"
export documents="$HOME/Documents"
