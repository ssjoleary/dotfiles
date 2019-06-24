export GPG_TTY=$(tty)
eval $(gpgconf --launch gpg-agent)
eval "$(hub alias -s)"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export AWS_ACCESS_KEY_ID='xxx'
export AWS_SECRET_ACCESS_KEY='xxx'

# Keep newest version of commands in history
export HISTCONTROL=ignoreboth:erasedups


alias vim=/usr/local/bin/vim
alias v=nvim
alias refresh='source ~/.bashrc'

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
	git pull origin master --rebase                                                     - whilst on you're on your feature branch
	git reset --hard origin/[branch]                                                    - reset branch after someone else has git push -f
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D    - remove local branches that are deleted on remote
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
  yagni        - Yagni is a static code analyzer that helps you find unused code in your applications and libraries.
  "
}

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

CDPATH=".:~/Documents/healthunlocked:~/Documents/healthunlocked/solaris"

# ctrl-s (i-search)
#stty -ixon
shopt -s cdable_vars

# Don't use ~ to define your home here, it won't work.
export repos="$HOME/Documents/healthunlocked"
export documents="$HOME/Documents"
export dotfiles="$HOME/Documents/workspace/dotfiles"
